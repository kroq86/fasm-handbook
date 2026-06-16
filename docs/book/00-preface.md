---
title: "Preface: What This Book Is"
permalink: /book/preface/
---

# Preface: What This Book Is

This is a practical FASM textbook. It is not a dump of every file in the
repository, and it is not a platform manual. The goal is simpler: start with
bytes, labels, memory, and OS calls, then gradually build programs that feel
real.

The examples use one source path. When Linux and macOS differ, the book calls
that out below the program instead of splitting the lesson into two versions.

## What You Need

- FASM syntax curiosity.
- A terminal.
- For macOS: [`fasm-mac`](https://github.com/kroq86/fasm-mac), which provides
  the `core/platform.inc` layer and converts supported ELF64 output to Mach-O.
- For Linux: FASM plus access to the same `core/platform.inc` include tree.

## How To Read

Read in order. Type the programs. Run them. Change one line and run again. The
book is designed around small experiments, not passive reference reading.

Next: [Hello, FASM]({{ '/book/hello-fasm/' | relative_url }}).
