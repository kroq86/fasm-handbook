---
title: "Chapter 5: A Program Can Choose"
permalink: /book/a-program-can-choose/
---

# Chapter 5: A Program Can Choose

## Big Idea

A program can compare two values and jump to different code. That is the root
of `if`, `else`, loops, validation, and error handling.

## Tiny Diagram

```text
rax = 7

compare rax with 7
  equal     -> print yes -> exit 0
  not equal -> print no  -> exit 1
```

## One Runnable FASM Program

```asm
format ELF64 executable 3
include "core/platform.inc"

segment readable executable
entry start

start:
	mov	rax, 7
	cmp	rax, 7
	jne	not_equal
	write_file STDOUT, yes_msg, yes_len
	exit 0

not_equal:
	write_file STDOUT, no_msg, no_len
	exit 1

segment readable writeable
yes_msg db "The program chose yes", 10
yes_len = $ - yes_msg
no_msg db "The program chose no", 10
no_len = $ - no_msg
```

Source file: [`examples/book/05_program_can_choose.asm`](https://github.com/kroq86/fasm-handbook/blob/main/examples/book/05_program_can_choose.asm)

## What Just Happened?

- `mov rax, 7` puts a value in a register.
- `cmp rax, 7` compares that value with `7`.
- `jne not_equal` means "jump if not equal."
- Because `rax` is equal to `7`, the jump is skipped.
- The program prints the yes message and exits with status `0`.

## How This Shows Up Later In C/Python

In C, `if (x != 7)` eventually becomes a comparison and a jump. In Python, `if
x != 7:` is higher-level, but the interpreter still performs the same kind of
decision underneath.

## Run It

Run on macOS with `fasm-mac`:

```sh
/Users/ll/fasm-mac/bin/fasm run examples/book/05_program_can_choose.asm
```

Run on Linux:

```sh
INCLUDE=/path/to/fasm-mac/fasm fasm -d TARGET_OS=linux examples/book/05_program_can_choose.asm /tmp/05_program_can_choose
/tmp/05_program_can_choose
```

Expected output:

```text
The program chose yes
```

## Platform Note

The comparison and jump are CPU instructions, so the lesson is the same on
Linux and macOS. Only the final write and exit touch the operating system.

## Try This

1. Change `mov rax, 7` to `mov rax, 8`.
2. Change `jne` to `je` and predict the output before running.
3. Change the `not_equal` exit code and inspect it with `echo $?`.

## Common Trap

`cmp` does not store a visible result in a normal variable. It updates CPU flags
that the next conditional jump reads.

## Next Step

Next, the book can turn decisions into loops and start reading input.
