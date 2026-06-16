---
title: "Chapter 4: The CPU Remembers Things"
permalink: /book/the-cpu-remembers-things/
---

# Chapter 4: The CPU Remembers Things

## Big Idea

The CPU has tiny storage places called registers. A register can hold a number,
an address, or a size while the next instruction runs.

## Tiny Diagram

```text
memory:
  msg -> bytes

registers:
  rsi = address of msg
  rdx = length of msg

write:
  STDOUT, rsi, rdx
```

## One Runnable FASM Program

```asm
format ELF64 executable 3
include "core/platform.inc"

segment readable executable
entry start

start:
	mov	rsi, msg
	mov	rdx, msg_len
	write_file STDOUT, rsi, rdx
	exit 0

segment readable writeable
msg db "Registers remember tiny things", 10
msg_len = $ - msg
```

Source file: [`examples/book/04_cpu_remembers.asm`](https://github.com/kroq86/fasm-handbook/blob/main/examples/book/04_cpu_remembers.asm)

## What Just Happened?

- `mov rsi, msg` puts the address of `msg` into `rsi`.
- `mov rdx, msg_len` puts the byte length into `rdx`.
- `write_file STDOUT, rsi, rdx` uses those register values.
- The CPU is not remembering a paragraph. It is remembering small numbers.

## How This Shows Up Later In C/Python

C variables often become register values while a function runs. Python hides
registers from you, but the interpreter and the CPU still use them constantly.

## Run It

Run on macOS with `fasm-mac`:

```sh
/Users/ll/fasm-mac/bin/fasm run examples/book/04_cpu_remembers.asm
```

Run on Linux:

```sh
INCLUDE=/path/to/fasm-mac/fasm fasm -d TARGET_OS=linux examples/book/04_cpu_remembers.asm /tmp/04_cpu_remembers
/tmp/04_cpu_remembers
```

Expected output:

```text
Registers remember tiny things
```

## Platform Note

Registers are CPU-level. The same x86_64 registers exist in both runs. The
platform difference appears when the macro turns `write_file` into an OS call.

## Try This

1. Change `mov rdx, msg_len` to a smaller number and observe truncated output.
2. Add a second message and load its address into `rsi`.
3. Move `msg_len` into `rax` first, then move `rax` into `rdx`.

## Common Trap

A register is not a variable with a name and type. It is a small CPU storage
slot. You decide what its current number means.

## Next Step

Next: [A Program Can Choose]({{ '/book/a-program-can-choose/' | relative_url }}).
