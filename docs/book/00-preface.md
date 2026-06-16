---
title: "Preface: What This Book Is"
permalink: /book/preface/
---

# Preface: What This Book Is

This book teaches programming from the machine up. It is not a dump of every
file in the repository, and it is not a platform manual. The goal is simpler:
understand what programs really do before higher-level languages hide the
machine.

We use FASM because it lets us see the machine without too much ceremony. FASM
is the microscope, not the final destination.

## What You Need

- FASM syntax curiosity.
- A terminal.
- For macOS: [`fasm-mac`](https://github.com/kroq86/fasm-mac), which provides
  the `core/platform.inc` layer and converts supported ELF64 output to Mach-O.
- For Linux: FASM plus access to the same `core/platform.inc` include tree.

## How To Read

Read in order. Type the programs. Run them. Change one line and run again. The
book is designed around small experiments, not passive reference reading.

Next: [What Is A Program?]({{ '/book/what-is-a-program/' | relative_url }}).
