---
title: "Chapter 1: Hello, FASM"
permalink: /book/hello-fasm/
---

# Chapter 1: Hello, FASM

## Why This Matters

The first program teaches the shape of every small FASM executable: a format
line, an include, executable code, data bytes, and one exit path.

## Concept

A program is bytes plus an entry point. The OS starts execution at `entry
start`. Our code writes bytes to standard output and exits with status `0`.

## One Complete FASM Program

```asm
format ELF64 executable 3
include "core/platform.inc"

segment readable executable
entry start

start:
	write_file STDOUT, msg, msg_len
	exit 0

segment readable writeable
msg db "Hello, FASM", 10
msg_len = $ - msg
```

Source file: [`examples/book/01_hello.asm`](https://github.com/kroq86/fasm-handbook/blob/main/examples/book/01_hello.asm)

## Line-By-Line Explanation

- `format ELF64 executable 3` tells FASM to emit an ELF64 executable layout.
- `include "core/platform.inc"` brings in the small platform layer used by this
  textbook.
- `segment readable executable` starts the code segment.
- `entry start` tells the loader where execution begins.
- `write_file STDOUT, msg, msg_len` writes exactly `msg_len` bytes.
- `exit 0` returns success to the operating system.
- `msg db ...` stores bytes in the data segment.
- `msg_len = $ - msg` lets FASM compute the byte length for us.

## Run It

Run on Linux:

```sh
INCLUDE=/path/to/fasm-mac/fasm fasm -d TARGET_OS=linux examples/book/01_hello.asm /tmp/01_hello
/tmp/01_hello
```

Run on macOS with `fasm-mac`:

```sh
/Users/ll/fasm-mac/bin/fasm run examples/book/01_hello.asm
```

Expected output:

```text
Hello, FASM
```

## macOS Note

The source code stays the same. `fasm-mac` passes `TARGET_OS=macos`, makes
`core/platform.inc` available, and converts the supported ELF64 output into an
x86_64 Mach-O executable.

## Common Mistakes

- Forgetting the newline byte `10`, which makes terminal output look glued to
  the next prompt.
- Hardcoding the length instead of using `$ - msg`.
- Using a platform include that is not on FASM's include path.

## Exercises

1. Change the message and confirm the output changes.
2. Remove the newline byte and observe the terminal prompt.
3. Add a second message with its own length and write it after the first one.

## Next Step

Next: [Printing Text]({{ '/book/printing-text/' | relative_url }}).
