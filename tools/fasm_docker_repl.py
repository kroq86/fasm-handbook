#!/usr/bin/env python3
"""
Cross-platform FASM runner and REPL via Docker (Linux container backend).
"""

from __future__ import annotations

import argparse
import atexit
import shlex
import subprocess
import sys
import uuid
from pathlib import Path


DEFAULT_IMAGE = "fasm-handbook-linux"


class DockerError(RuntimeError):
    pass


def _run(cmd: list[str], *, check: bool = True, text: bool = True) -> subprocess.CompletedProcess:
    try:
        proc = subprocess.run(cmd, check=False, text=text, capture_output=True)
    except FileNotFoundError as exc:
        raise DockerError("Docker CLI not found. Install Docker Desktop/Engine first.") from exc
    if check and proc.returncode != 0:
        err = proc.stderr.strip() or proc.stdout.strip() or f"Command failed: {' '.join(cmd)}"
        raise DockerError(err)
    return proc


def _project_root() -> Path:
    return Path(__file__).resolve().parents[1]


def docker_image_exists(image: str) -> bool:
    proc = _run(["docker", "image", "inspect", image], check=False)
    return proc.returncode == 0


def build_image(
    image: str,
    dockerfile: str = "Dockerfile.fasm",
    *,
    fasm_version: str = "1.73.34",
    no_cache: bool = False,
) -> None:
    root = _project_root()
    cmd = ["docker", "build", "-f", dockerfile, "-t", image, "--build-arg", f"FASM_VERSION={fasm_version}"]
    if no_cache:
        cmd.append("--no-cache")
    cmd.append(".")
    proc = subprocess.run(cmd, cwd=root)
    if proc.returncode != 0:
        raise DockerError("Failed to build Docker image.")


def ensure_image(image: str) -> None:
    if docker_image_exists(image):
        return
    raise DockerError(
        f"Docker image '{image}' not found.\n"
        f"Build it first:\n  ./fasm build-image --image {image}"
    )


def run_in_container(image: str, shell_script: str, *, persistent_container: str | None = None) -> tuple[int, str, str]:
    root = _project_root()
    if persistent_container:
        cmd = ["docker", "exec", persistent_container, "bash", "-lc", shell_script]
    else:
        cmd = [
            "docker",
            "run",
            "--rm",
            "-v",
            f"{root}:/work",
            "-w",
            "/work",
            image,
            "bash",
            "-lc",
            shell_script,
        ]
    proc = _run(cmd, check=False)
    return proc.returncode, proc.stdout, proc.stderr


def compile_and_run_source(
    image: str,
    source_rel: str,
    output_rel: str,
    *,
    persistent_container: str | None = None,
) -> int:
    source_q = shlex.quote(source_rel)
    output_q = shlex.quote(output_rel)
    script = f"""
set -e
fasm {source_q} {output_q}
chmod +x {output_q}
./{output_q}
"""
    code, out, err = run_in_container(image, script, persistent_container=persistent_container)
    if out:
        print(out, end="")
    if err:
        print(err, end="", file=sys.stderr)
    return code


class ReplSession:
    def __init__(self, image: str) -> None:
        self.image = image
        self.buffer: list[str] = []
        self.root = _project_root()
        self.work_dir = self.root / ".fasm-repl"
        self.work_dir.mkdir(exist_ok=True)
        self.src_rel = ".fasm-repl/session.asm"
        self.bin_rel = ".fasm-repl/session.bin"
        self.container_name = f"fasm-repl-{uuid.uuid4().hex[:8]}"
        self.running = False

    def start(self) -> None:
        cmd = [
            "docker",
            "run",
            "-d",
            "--rm",
            "--name",
            self.container_name,
            "-v",
            f"{self.root}:/work",
            "-w",
            "/work",
            self.image,
            "sleep",
            "infinity",
        ]
        _run(cmd)
        self.running = True
        atexit.register(self.stop)

    def stop(self) -> None:
        if not self.running:
            return
        _run(["docker", "stop", self.container_name], check=False)
        self.running = False

    def save_buffer(self, path: Path) -> None:
        path.write_text("\n".join(self.buffer) + "\n", encoding="utf-8")

    def run_buffer(self) -> int:
        src_path = self.root / self.src_rel
        self.save_buffer(src_path)
        return compile_and_run_source(
            self.image,
            self.src_rel,
            self.bin_rel,
            persistent_container=self.container_name,
        )


def cmd_build_image(args: argparse.Namespace) -> int:
    build_image(
        args.image,
        args.dockerfile,
        fasm_version=args.fasm_version,
        no_cache=args.no_cache,
    )
    print(f"Built image: {args.image}")
    return 0


def cmd_run(args: argparse.Namespace) -> int:
    ensure_image(args.image)
    root = _project_root()
    src_path = Path(args.source).resolve()
    if not src_path.exists():
        raise DockerError(f"Source file not found: {src_path}")

    try:
        src_rel = src_path.relative_to(root).as_posix()
    except ValueError as exc:
        raise DockerError(f"Source must be inside repository root: {root}") from exc

    if args.output:
        output_path = Path(args.output)
        if output_path.is_absolute():
            try:
                output_rel = output_path.resolve().relative_to(root).as_posix()
            except ValueError as exc:
                raise DockerError(f"Output must be inside repository root: {root}") from exc
        else:
            output_rel = output_path.as_posix()
    else:
        output_rel = src_path.with_suffix("").relative_to(root).as_posix()

    return compile_and_run_source(args.image, src_rel, output_rel)


def cmd_repl(args: argparse.Namespace) -> int:
    ensure_image(args.image)
    repl = ReplSession(args.image)
    repl.start()

    print("FASM Docker REPL")
    print("Commands: :run, :clear, :show, :save <file>, :quit, :help")
    print("Type assembly lines. Use :run to compile+execute.")

    while True:
        try:
            line = input("fasm> ")
        except EOFError:
            print()
            break
        except KeyboardInterrupt:
            print("\nUse :quit to exit.")
            continue

        if line.startswith(":"):
            parts = line.split(maxsplit=1)
            cmd = parts[0]
            arg = parts[1] if len(parts) > 1 else ""

            if cmd in (":quit", ":q", ":exit"):
                break
            if cmd == ":help":
                print("Commands: :run, :clear, :show, :save <file>, :quit")
                continue
            if cmd == ":clear":
                repl.buffer.clear()
                print("Buffer cleared.")
                continue
            if cmd == ":show":
                if not repl.buffer:
                    print("(empty)")
                else:
                    for idx, text in enumerate(repl.buffer, start=1):
                        print(f"{idx:4}: {text}")
                continue
            if cmd == ":save":
                if not arg:
                    print("Usage: :save <path>")
                    continue
                save_path = Path(arg)
                if not save_path.is_absolute():
                    save_path = repl.root / save_path
                save_path.parent.mkdir(parents=True, exist_ok=True)
                repl.save_buffer(save_path)
                print(f"Saved: {save_path}")
                continue
            if cmd == ":run":
                if not repl.buffer:
                    print("Buffer is empty.")
                    continue
                code = repl.run_buffer()
                if code != 0:
                    print(f"[exit code: {code}]")
                continue

            print(f"Unknown command: {cmd}")
            continue

        repl.buffer.append(line)

    repl.stop()
    return 0


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="FASM Docker runner and REPL")
    sub = parser.add_subparsers(dest="command", required=True)

    p_build = sub.add_parser("build-image", help="Build Docker image with Linux FASM toolchain")
    p_build.add_argument("--image", default=DEFAULT_IMAGE, help="Docker image tag")
    p_build.add_argument("--dockerfile", default="Dockerfile.fasm", help="Dockerfile path")
    p_build.add_argument("--fasm-version", default="1.73.34", help="FASM version for tarball install")
    p_build.add_argument("--no-cache", action="store_true", help="Build Docker image with --no-cache")
    p_build.set_defaults(func=cmd_build_image)

    p_run = sub.add_parser("run", help="Compile and run a .asm file in Docker")
    p_run.add_argument("source", help="Path to .asm file (must be inside repository)")
    p_run.add_argument("--output", help="Output binary path (default: source name without .asm)")
    p_run.add_argument("--image", default=DEFAULT_IMAGE, help="Docker image tag")
    p_run.set_defaults(func=cmd_run)

    p_repl = sub.add_parser("repl", help="Interactive buffer + run loop backed by Docker")
    p_repl.add_argument("--image", default=DEFAULT_IMAGE, help="Docker image tag")
    p_repl.set_defaults(func=cmd_repl)

    return parser


def main() -> int:
    parser = build_parser()
    args = parser.parse_args()
    try:
        return args.func(args)
    except DockerError as exc:
        print(f"Error: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
