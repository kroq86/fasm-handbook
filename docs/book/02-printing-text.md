---
title: "Chapter 2: Printing Text"
permalink: /book/printing-text/
---

# Chapter 2: Printing Text

## Why This Matters

Printing text is not magic. A program writes a range of bytes to an output
stream. Once that idea is clear, files, logs, errors, and network responses all
become less mysterious.

## Concept

`write_file` takes three things: a destination, a pointer to bytes, and a byte
count. The text is not special to the CPU. It is just memory.

## One Complete FASM Program

```asm
format ELF64 executable 3
include "core/platform.inc"

segment readable executable
entry start

start:
	write_file STDOUT, title, title_len
	write_file STDOUT, body, body_len
	exit 0

segment readable writeable
title db "Printing text", 10
title_len = $ - title
body db "A program speaks by writing bytes to an output stream.", 10
body_len = $ - body
```

Source file: [`examples/book/02_printing_text.asm`](https://github.com/kroq86/fasm-handbook/blob/main/examples/book/02_printing_text.asm)

## Line-By-Line Explanation

- The first `write_file` sends the title bytes to `STDOUT`.
- The second `write_file` sends the body bytes to the same stream.
- Each message has its own computed length.
- Nothing in the code says "string object"; FASM stores bytes and the platform
  layer writes them.

## Run It

Run on Linux:

```sh
INCLUDE=/path/to/fasm-mac/fasm fasm -d TARGET_OS=linux examples/book/02_printing_text.asm /tmp/02_printing_text
/tmp/02_printing_text
```

Run on macOS with `fasm-mac`:

```sh
/Users/ll/fasm-mac/bin/fasm run examples/book/02_printing_text.asm
```

Expected output:

```text
Printing text
A program speaks by writing bytes to an output stream.
```

## macOS Note

The program still writes bytes to `STDOUT`. The difference is below the macro:
macOS uses Darwin's syscall layer and Mach-O output, while Linux uses Linux
syscall numbers and ELF64 output.

## Common Mistakes

- Reusing `title_len` for `body`.
- Placing data in the executable segment by accident.
- Forgetting that lengths are byte counts, not "characters" in a higher-level
  language sense.

## Exercises

1. Add a third line.
2. Print the same `body` twice without duplicating the data.
3. Move the newline into its own `nl db 10` byte and print it separately.

## Next Step

Next: [Exit Codes And Errors]({{ '/book/exit-codes-and-errors/' | relative_url }}).
