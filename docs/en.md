---
title: English Overview
permalink: /en/
---

# FASM Examples and Learning Repository

This repository collects FASM examples, wrappers, utilities, and reference material for x86_64 Linux.

## Structure

### Core files

- `common.inc` for shared macros and helper patterns.
- `linux.inc` for Linux syscall constants and support code.

### Basic examples

- `mycat.asm` for file reading.
- `arg.asm` for command-line arguments.
- `fib.asm` for number generation and printing.
- `two_sum.asm` for a classic algorithm exercise.
- `file_ops.asm` for lower-level file operations.

### Advanced examples

- `add/` for FASM with Python and C wrappers.
- `binary_search/` for search logic and wrapper examples.
- `coroutines/` for switching and coroutine experiments.
- `vec/` for vector and dot product work.
- `hex_editor/` for a practical FASM utility.

## Documentation

- [English handbook]({{ '/book-en/' | relative_url }})
- [Russian handbook]({{ '/book-ru/' | relative_url }})
- `AI_FASM_RULES.md` for repository-specific AI coding constraints.

## Why English First

English is the stronger default for GitHub Pages because:

- GitHub search and external discovery work better with English metadata.
- Assembly programming audiences are spread across many countries.
- Other projects can link to this handbook without translation friction.

Russian still makes sense as a full parallel section, especially for teaching and note-taking.

## Build Example

```bash
fasm mycat.asm
chmod +x mycat
./mycat
```

## Suggested GitHub Topics

`fasm`, `flat-assembler`, `assembly`, `x86-64`, `linux`, `elf64`, `systems-programming`, `low-level-programming`, `algorithms`, `simd`
