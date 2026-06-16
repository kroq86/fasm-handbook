---
title: "Chapter 3: Text Is Bytes"
permalink: /book/text-is-bytes/
---

# Chapter 3: Text Is Bytes

## Big Idea

Text is stored as numbers. The terminal turns those numbers into shapes you can
read.

## Tiny Diagram

```text
bytes:
  65 66 67 10

ASCII:
  65 -> A
  66 -> B
  67 -> C
  10 -> newline
```

## One Runnable FASM Program

```asm
format ELF64 executable 3
include "core/platform.inc"

segment readable executable
entry start

start:
	write_file STDOUT, letters, letters_len
	exit 0

segment readable writeable
letters db 65, 66, 67, 10
letters_len = $ - letters
```

Source file: [`examples/book/03_text_is_bytes.asm`](https://github.com/kroq86/fasm-handbook/blob/main/examples/book/03_text_is_bytes.asm)

## What Just Happened?

- `db` means "define bytes."
- We did not write `"ABC"` as text.
- We wrote the byte values `65`, `66`, `67`, and `10`.
- The terminal interpreted those bytes as ASCII and showed `ABC`.

## How This Shows Up Later In C/Python

C strings and Python strings feel higher-level, but they still become bytes
when a program prints, saves, or sends them. Encodings are the rules that say
which bytes mean which characters.

## Run It

Run on macOS with `fasm-mac`:

```sh
/Users/ll/fasm-mac/bin/fasm run examples/book/03_text_is_bytes.asm
```

Run on Linux:

```sh
INCLUDE=/path/to/fasm-mac/fasm fasm -d TARGET_OS=linux examples/book/03_text_is_bytes.asm /tmp/03_text_is_bytes
/tmp/03_text_is_bytes
```

Expected output:

```text
ABC
```

## Platform Note

The byte values do not change between Linux and macOS. Only the low-level door
used to write them is platform-specific.

## Try This

1. Change `65, 66, 67` to `72, 105`.
2. Remove `10` and watch the newline disappear.
3. Replace the byte list with `letters db "ABC", 10` and confirm the output is
   the same.

## Common Trap

Characters are not the same thing as bytes in every language or encoding. This
chapter uses simple ASCII so the relationship is visible.

## Next Step

Next: [The CPU Remembers Things]({{ '/book/the-cpu-remembers-things/' | relative_url }}).
