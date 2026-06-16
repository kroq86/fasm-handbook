---
title: Examples
permalink: /examples/
---

# Example Catalog

This page is the canonical map of executable and wrapper-based examples in the repository.

## Basic Examples

| Example | Focus | Files |
| --- | --- | --- |
| `examples/book/` | textbook examples with one canonical source path | `01_hello.asm`, `02_printing_text.asm`, `03_exit_codes.asm` |
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

## macOS Tool Case Studies

The canonical source for these apps lives in
[`fasm-mac`](https://github.com/kroq86/fasm-mac). Use them after the Linux
examples when you want finished macOS tools rather than isolated demos.

| Tool | Focus | Source |
| --- | --- | --- |
| `machodoctor` | Mach-O inspection and release checks | [`fasm/apps/machodoctor.asm`](https://github.com/kroq86/fasm-mac/blob/main/fasm/apps/machodoctor.asm) |
| `fscan` | literal search over files | [`fasm/apps/fscan.asm`](https://github.com/kroq86/fasm-mac/blob/main/fasm/apps/fscan.asm) |
| `logknife` | structured log slicing | [`fasm/apps/logknife.asm`](https://github.com/kroq86/fasm-mac/blob/main/fasm/apps/logknife.asm) |
| `hexpeek` | compact file hex dump | [`fasm/apps/hexpeek.asm`](https://github.com/kroq86/fasm-mac/blob/main/fasm/apps/hexpeek.asm) |
| `logbus` | durable append-only message broker with kqueue coroutines | [`fasm/apps/logbus.asm`](https://github.com/kroq86/fasm-mac/blob/main/fasm/apps/logbus.asm) |
| `logvec` | FASM vector math with Zig index orchestration | [`docs/logvec.md`](https://github.com/kroq86/fasm-mac/blob/main/docs/logvec.md) |
| `macdbg` | advanced AI-native LLDB snapshot debugger | [`fasm/apps/macdbg.asm`](https://github.com/kroq86/fasm-mac/blob/main/fasm/apps/macdbg.asm) |

## Core Support Files

- `common.inc` for reusable macros and helper routines.
- `linux.inc` for Linux syscall constants and wrappers.
- `AI_FASM_RULES.md` for repository-specific FASM generation conventions.
- `FASM_REFERENCE_GUIDE.md` for low-level reference material.

## Suggested Reading Order

1. Start with [FASM From Zero]({{ '/book/' | relative_url }}) and `examples/book/`.
2. Continue with `fib.asm`, `arg.asm`, and `mycat.asm`.
3. Move to `binary_search/`, `add/`, and `cadd/`.
4. Continue with `coroutines/`, `vec/`, `hex_editor/`, and `oop_game/`.
5. Use the [macOS runtime notes]({{ '/fasm-mac/' | relative_url }}) to continue
   from learning examples into `fasm-mac` products.
6. Use the handbook pages for concepts and the full reference pages for details.
