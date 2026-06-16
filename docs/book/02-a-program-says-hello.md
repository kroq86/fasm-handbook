---
title: "Chapter 2: A Program Says Hello"
permalink: /book/a-program-says-hello/
---

# Chapter 2: A Program Says Hello

## Big Idea

Printing is not a spell. A program puts bytes in memory, then asks the operating
system to write those bytes to the terminal.

## Tiny Diagram

```text
memory:
  [msg] 48 65 6c 6c 6f 2c 20 6d 61 63 68 69 6e 65 0a

CPU:
  start -> write bytes -> exit

OS:
  STDOUT -> terminal
```

## One Runnable FASM Program

```asm
format ELF64 executable 3
include "core/platform.inc"

segment readable executable
entry start

start:
	write_file STDOUT, msg, msg_len
	exit 0

segment readable writeable
msg db "Hello, machine", 10
msg_len = $ - msg
```

Source file: [`examples/book/02_a_program_says_hello.asm`](https://github.com/kroq86/fasm-handbook/blob/main/examples/book/02_a_program_says_hello.asm)

## What Just Happened?

- `msg db ...` stores bytes in memory.
- `10` is the newline byte.
- `msg_len = $ - msg` asks FASM to compute the number of bytes.
- `write_file STDOUT, msg, msg_len` writes exactly those bytes.
- The terminal displays the bytes as text.

## How This Shows Up Later In C/Python

In Python, `print("Hello, machine")` hides the memory and OS request. In C,
`printf` hides less, but it still eventually asks the OS to write bytes. Here we
can see the shape directly.

## Run It

Run on macOS with `fasm-mac`:

```sh
/Users/ll/fasm-mac/bin/fasm run examples/book/02_a_program_says_hello.asm
```

Run on Linux:

```sh
INCLUDE=/path/to/fasm-mac/fasm fasm -d TARGET_OS=linux examples/book/02_a_program_says_hello.asm /tmp/02_a_program_says_hello
/tmp/02_a_program_says_hello
```

Expected output:

```text
Hello, machine
```

## Platform Note

The idea is the same on Linux and macOS: write these bytes, then exit. The macro
uses different OS calls underneath.

## Try This

1. Change the message.
2. Remove the newline byte and notice the terminal prompt.
3. Add a second message and write it after the first one.

## Common Trap

Do not hardcode the length by hand. Let FASM compute it with `$ - msg`, or your
program will eventually print too little or too much.

## Next Step

Next: [Text Is Bytes]({{ '/book/text-is-bytes/' | relative_url }}).
