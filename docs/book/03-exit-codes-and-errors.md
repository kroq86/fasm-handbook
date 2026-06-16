---
title: "Chapter 3: Exit Codes And Errors"
permalink: /book/exit-codes-and-errors/
---

# Chapter 3: Exit Codes And Errors

## Why This Matters

Command-line programs do not only print text. They also report success or
failure to the shell. That is how scripts decide what to do next.

## Concept

The stack starts with `argc`, the argument count. This program succeeds when no
extra arguments are passed. If the user passes arguments, it prints usage text
to standard error and exits with status `2`.

## One Complete FASM Program

```asm
format ELF64 executable 3
include "core/platform.inc"

segment readable executable
entry start

start:
	mov	rbx, rsp
	cmp	qword [rbx], 1
	jne	usage
	write_file STDOUT, ok_msg, ok_len
	exit 0

usage:
	write_file STDERR, usage_msg, usage_len
	exit 2

segment readable writeable
ok_msg db "No arguments: success", 10
ok_len = $ - ok_msg
usage_msg db "usage: 03_exit_codes", 10
usage_len = $ - usage_msg
```

Source file: [`examples/book/03_exit_codes.asm`](https://github.com/kroq86/fasm-handbook/blob/main/examples/book/03_exit_codes.asm)

## Line-By-Line Explanation

- `mov rbx, rsp` keeps the initial stack pointer available.
- `qword [rbx]` reads `argc`.
- `cmp qword [rbx], 1` checks for exactly one argument: the program name.
- `jne usage` jumps to the error path when extra arguments exist.
- The success path writes to `STDOUT` and exits with `0`.
- The usage path writes to `STDERR` and exits with `2`.

## Run It

Run on Linux:

```sh
INCLUDE=/path/to/fasm-mac/fasm fasm -d TARGET_OS=linux examples/book/03_exit_codes.asm /tmp/03_exit_codes
/tmp/03_exit_codes
```

Run on macOS with `fasm-mac`:

```sh
/Users/ll/fasm-mac/bin/fasm run examples/book/03_exit_codes.asm
```

Expected output:

```text
No arguments: success
```

## macOS Note

The source code stays the same. `STDOUT`, `STDERR`, and `exit` come from the
platform include. The platform layer maps the same lesson to the OS-specific
syscall contract.

## Common Mistakes

- Reading `[rsp + 8]` first and forgetting that `[rsp]` is `argc`.
- Returning `0` from an error path.
- Printing usage text to stdout instead of stderr.

## Exercises

1. Change the success exit code to `7`, run it, and inspect `$?` in the shell.
2. Change the program so one extra argument is required.
3. Add a second error path with a different usage message and exit code.

## Next Step

Next, the book starts turning these small pieces into file-oriented tools.
