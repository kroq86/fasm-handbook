# FASM Handbook

A practical FASM learning repository: textbook chapters, runnable examples,
wrapper experiments, and reference material.

## FASM From Zero

The main reader path is [FASM From Zero](docs/book/index.md): one complete
program per chapter, line-by-line explanations, exercises, and short platform
run notes under the same source listing.

The first textbook examples live in `examples/book/`:

- `01_hello.asm`
- `02_printing_text.asm`
- `03_exit_codes.asm`

## macOS Companion

When you want to run the same style of examples as installable macOS developer
tools, use the companion project:

- [fasm-mac](https://github.com/kroq86/fasm-mac) — a macOS x86_64 FASM toolchain
  and product lab with Mach-O output, reusable core includes, kqueue servers,
  Homebrew formulae, and finished tools such as `machodoctor`, `logknife`,
  `fscan`, `hexpeek`, `logbus`, `logvec`, and `macdbg`.

Use this repository for the textbook. Use `fasm-mac` when you want Mach-O
output, Darwin syscalls, release checks, and brew-worthy native tools.

## GitHub Pages

This repository now includes a `docs/` site for GitHub Pages.

- Main landing page: `docs/index.md`
- Textbook: `docs/book/index.md`
- English overview: `docs/en.md`
- Russian overview: `docs/ru.md`
- Example catalog: `docs/examples.md`
- Repository map: `docs/repository-map.md`
- English handbook: `docs/book-en.md`
- Russian handbook: `docs/book-ru.md`
- macOS runtime notes: `docs/fasm-mac.md`
- Full reference chapter: `docs/reference-guide-full.md`
- AI rules chapter: `docs/ai-fasm-rules.md`

## Repository Structure

```text
.
├── common.inc
├── linux.inc
├── mycat.asm
├── arg.asm
├── fib.asm
├── two_sum.asm
├── file_ops.asm
├── add/
├── binary_search/
├── cadd/
├── coroutines/
├── examples/book/
├── hex_editor/
├── oop_game/
├── vec/
├── AI_FASM_RULES.md
├── FASM_REFERENCE_GUIDE.md
└── docs/
```

## Key Areas

- Basic assembly examples for file I/O, arguments, and arithmetic.
- Textbook examples with one canonical source path.
- Algorithm examples including two-sum and binary search.
- Python and C wrapper experiments for assembly integration.
- Advanced stateful interop examples such as `oop_game/`.
- A bridge into `fasm-mac` for Mach-O output and finished macOS tools.
- Reference material for learning FASM faster.

## Getting Started

Install FASM:

```bash
sudo apt-get install fasm
```

Build an example:

```bash
fasm mycat.asm
chmod +x mycat
./mycat
```

## Cross-Platform Docker Runner and REPL

If you are on macOS or Windows, use Docker as a Linux backend:

1. Build the image:

```bash
./fasm build-image
```

If Docker layer cache got stale, rebuild clean:

```bash
./fasm build-image --no-cache
```

If you need another FASM release:

```bash
./fasm build-image --fasm-version 1.73.34
```

2. Run an existing `.asm` file:

```bash
./fasm run fib.asm
```

3. Start interactive REPL-like mode:

```bash
./fasm repl
```

Inside REPL:

- Add assembly lines to a buffer.
- Use `:run` to compile and execute in Docker.
- Use `:save <file>` to store the current buffer.
- Use `:clear`, `:show`, `:quit` as needed.

Notes:

- Docker image is defined in `Dockerfile.fasm`.
- REPL session files are stored in `.fasm-repl/` (ignored by git).
- `./fasm` is a local wrapper around `tools/fasm_docker_repl.py`.

## Imported From

Imported FASM files are now stored separately under `imports/`:

- `imports/plojure-fasm/basic/cpu.py` (from `fasm/basic/cpu.py`)
- `imports/plojure-fasm/advanced/oop_game/rules.mdc` (from `fasm/advanced/oop_game/rules.mdc`)

Books are merged directly into:

- `docs/book-en.md` (expanded with CPU + FASM material)
- `docs/book-ru.md` (expanded with CPU + FASM material)

## Documentation

- [AI FASM Rules](AI_FASM_RULES.md)
- [FASM Reference Guide](FASM_REFERENCE_GUIDE.md)
- GitHub Pages handbook in `docs/`
- [FASM From Zero](docs/book/index.md)
- [Example catalog](docs/examples.md)
- [macOS runtime notes](docs/fasm-mac.md)

## Debugging

- GDB frontend: <https://github.com/nakst/gf>
- Use `int3` in code to set a breakpoint.
- Use `readelf -h BINARY` to inspect the ELF entry point.

![elf](https://github.com/kroq86/fasm-handbook/assets/29804069/222c37f7-8bb2-4a23-bbbd-8e3167d446c4)

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE).
