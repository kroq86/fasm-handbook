---
title: "Chapter 1: What Is A Program?"
permalink: /book/what-is-a-program/
---

# Chapter 1: What Is A Program?

## Big Idea

A program is not magic. It is bytes arranged so the computer knows where to
start and what tiny commands to run.

## Tiny Diagram

```text
file on disk:
  bytes bytes bytes

loader:
  puts executable bytes into memory

CPU:
  starts at entry -> runs instructions -> exits
```

## One Runnable FASM Program

```asm
format ELF64 executable 3
include "core/platform.inc"

segment readable executable
entry start

start:
	exit 0
```

Source file: [`examples/book/01_what_is_a_program.asm`](https://github.com/kroq86/fasm-handbook/blob/main/examples/book/01_what_is_a_program.asm)

## What Just Happened?

- `format ELF64 executable 3` asks FASM to build an executable layout.
- `include "core/platform.inc"` gives us the shared platform names used in this
  book.
- `entry start` says where the CPU begins.
- `start:` is a label, a name for an address.
- `exit 0` tells the operating system the program finished successfully.

The program prints nothing, but it is still a real program. It starts, runs one
OS-facing action, and exits.

## How This Shows Up Later In C/Python

In C, `return 0;` from `main` becomes the same idea: the program exits with a
success code. In Python, the interpreter is the real executable; it reads your
Python file and later exits too.

## Run It

Run on macOS with `fasm-mac`:

```sh
/Users/ll/fasm-mac/bin/fasm run examples/book/01_what_is_a_program.asm
```

Run on Linux:

```sh
INCLUDE=/path/to/fasm-mac/fasm fasm -d TARGET_OS=linux examples/book/01_what_is_a_program.asm /tmp/01_what_is_a_program
/tmp/01_what_is_a_program
```

The program has no output. Check the shell status with `echo $?`; it should be
`0`.

## Platform Note

The source stays the same. Linux and macOS use different OS doors for exiting,
and `core/platform.inc` gives this book one name for that door: `exit`.

## Try This

1. Change `exit 0` to `exit 7` and inspect `echo $?`.
2. Rename `start` to `begin` in both places.
3. Delete `entry start` and see how FASM reacts.

## Common Trap

No printed text does not mean "nothing happened." A command-line program can be
useful just by returning a status code.

## Next Step

Next: [A Program Says Hello]({{ '/book/a-program-says-hello/' | relative_url }}).
