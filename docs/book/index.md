---
title: From Bytes To Programs
permalink: /book/
---

# From Bytes To Programs
## Learn What Programs Really Do With FASM

Most courses start with Python. This one starts with what Python stands on:
bytes, memory, CPU instructions, and the operating system.

FASM is the microscope. The subject is programming from the machine up.

## Start Here

1. [Preface: What This Book Is]({{ '/book/preface/' | relative_url }})
2. [Chapter 1: What Is A Program?]({{ '/book/what-is-a-program/' | relative_url }})
3. [Chapter 2: A Program Says Hello]({{ '/book/a-program-says-hello/' | relative_url }})
4. [Chapter 3: Text Is Bytes]({{ '/book/text-is-bytes/' | relative_url }})
5. [Chapter 4: The CPU Remembers Things]({{ '/book/the-cpu-remembers-things/' | relative_url }})
6. [Chapter 5: A Program Can Choose]({{ '/book/a-program-can-choose/' | relative_url }})

## Learning Ladder

- A file can be an executable program.
- Text is bytes in memory.
- The CPU starts at an entry point.
- Registers remember tiny values.
- Comparisons and jumps let programs choose.
- Later chapters connect those ideas to C and Python.

## The Rule

Each chapter uses one main source listing. Platform differences are short run
notes under the same program, not separate Linux and macOS lessons.

## Companion Material

- [fasm-mac runtime notes]({{ '/fasm-mac/' | relative_url }}) for running the
  same examples as x86_64 Mach-O on macOS.
- [Example catalog]({{ '/examples/' | relative_url }}) for older repository
  examples and wrapper experiments.
- [Full reference]({{ '/reference-guide/' | relative_url }}) when you need
  directive or syntax details.
