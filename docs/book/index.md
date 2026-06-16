---
title: FASM From Zero
permalink: /book/
---

# FASM From Zero
## Build Real Programs in Assembly

This is the textbook path. It teaches one idea at a time, with one canonical
FASM program per lesson. Platform details stay in short notes under the program:
the lesson is the same, while Linux and macOS differ only in the OS contract and
the command used to run the code.

## Start Here

1. [Preface: What This Book Is]({{ '/book/preface/' | relative_url }})
2. [Chapter 1: Hello, FASM]({{ '/book/hello-fasm/' | relative_url }})
3. [Chapter 2: Printing Text]({{ '/book/printing-text/' | relative_url }})
4. [Chapter 3: Exit Codes And Errors]({{ '/book/exit-codes-and-errors/' | relative_url }})

## The Rule

Each chapter uses one main source listing. If macOS needs a different command,
or Linux needs an include path, the difference is explained after the code. The
reader should not have to learn two separate books.

## Companion Material

- [fasm-mac runtime notes]({{ '/fasm-mac/' | relative_url }}) for running the
  same examples as x86_64 Mach-O on macOS.
- [Example catalog]({{ '/examples/' | relative_url }}) for older repository
  examples and wrapper experiments.
- [Full reference]({{ '/reference-guide/' | relative_url }}) when you need
  directive or syntax details.
