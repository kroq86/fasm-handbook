---
title: Examples
permalink: /examples/
---

# Example Catalog

This page is the canonical map of executable and wrapper-based examples in the repository.

## Basic Examples

| Example | Focus | Files |
| --- | --- | --- |
| `mycat.asm` | file reading and writing | root |
| `arg.asm` | command-line argument handling | root |
| `fib.asm` | integer math and output | root |
| `two_sum.asm` | algorithmic search pattern | root |
| `file_ops.asm` | lower-level file operations | root |
| `quicksort.asm` | sorting example | root |

## Integrated Examples

| Example | Focus | Files |
| --- | --- | --- |
| `add/` | FASM function exposed through C and Python | `add.asm`, `wrapper.c`, `add.py` |
| `binary_search/` | standalone binary search and wrapper variant | `bin_s.asm`, `bin_s.py`, `wrapper/` |
| `coroutines/` | coroutine/context switch experiment | `switch.asm`, `wrapper.c`, `coroutine.py` |
| `vec/` | vector math and dot product via shared library | `dot_product.asm`, `wrapper.c`, `vec.py` |
| `cadd/` | pure C shared-library bridge example | `add.c`, `add.py` |
| `hex_editor/` | practical binary inspection utility | `hex_editor.asm` |
| `oop_game/` | OOP-style state model in FASM driven from Python | `game.asm`, `wrapper.c`, `game.py` |

## Core Support Files

- `common.inc` for reusable macros and helper routines.
- `linux.inc` for Linux syscall constants and wrappers.
- `AI_FASM_RULES.md` for repository-specific FASM generation conventions.
- `FASM_REFERENCE_GUIDE.md` for low-level reference material.

## Suggested Reading Order

1. Start with `fib.asm`, `arg.asm`, and `mycat.asm`.
2. Move to `binary_search/`, `add/`, and `cadd/`.
3. Continue with `coroutines/`, `vec/`, `hex_editor/`, and `oop_game/`.
4. Use the handbook pages for concepts and the full reference pages for details.
