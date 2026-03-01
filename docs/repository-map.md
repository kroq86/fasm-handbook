---
title: Repository Map
permalink: /repository-map/
---

# Repository Map

The repository follows a simple split: root-level standalone examples, folder-based integrated projects, and Pages-backed documentation.

## Root

- `common.inc`, `linux.inc`: shared include files and syscall helpers.
- `*.asm`: standalone learning examples and algorithms.
- `AI_FASM_RULES.md`, `FASM_REFERENCE_GUIDE.md`: source docs mirrored into the Pages handbook.
- `docs/`: GitHub Pages site.

## Project Folders

- `add/`: minimal shared-library example with Python and C interop.
- `binary_search/`: algorithm sample plus wrapper variant.
- `cadd/`: pure C bridge example.
- `coroutines/`: context switching and coroutine bindings.
- `hex_editor/`: standalone utility with its own README.
- `oop_game/`: OOP-style game state experiment in FASM.
- `vec/`: vector math example focused on dot products.

## Documentation Layers

- `README.md`: short repository entry point.
- `docs/index.md`: website landing page.
- `docs/examples.md`: example catalog.
- `docs/repository-map.md`: structural overview.
- `docs/book-en.md` and `docs/book-ru.md`: handbook overview pages.
- `docs/reference-guide-full.md` and `docs/ai-fasm-rules.md`: full chapter pages.

## Planned Consolidation

- Keep examples in their current paths to avoid breaking commands.
- Normalize README files and build instructions across example folders.
- Pull only FASM-specific material from other repositories, not unrelated Lisp or database content.
