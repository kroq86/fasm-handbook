# FASM Examples and Learning Repository

A collection of FASM (Flat Assembler) examples, wrappers, utilities, and handbook material for x86_64 Linux.

## GitHub Pages

This repository now includes a `docs/` site for GitHub Pages.

- Main landing page: `docs/index.md`
- English overview: `docs/en.md`
- Russian overview: `docs/ru.md`
- English handbook: `docs/book-en.md`
- Russian handbook: `docs/book-ru.md`
- Full reference chapter: `docs/reference-guide-full.md`
- AI rules chapter: `docs/ai-fasm-rules.md`

To publish it on GitHub:

1. Open repository `Settings`.
2. Open `Pages`.
3. Select `Deploy from a branch`.
4. Choose the default branch and the `/docs` folder.

## Recommended GitHub Topics

GitHub repository topics are set in the GitHub UI, not from files in the repo. Recommended topics for this project:

`fasm`, `flat-assembler`, `assembly`, `x86-64`, `linux`, `elf64`, `systems-programming`, `low-level-programming`, `assembler`, `algorithms`, `simd`, `coroutines`

## Repository Structure

```text
.
├── common.inc
├── linux.inc
├── mycat.asm
├── arg.asm
├── fib.asm
├── two_sum.asm
├── file_ops.asm
├── add/
├── binary_search/
├── cadd/
├── coroutines/
├── hex_editor/
├── vec/
├── AI_FASM_RULES.md
├── FASM_REFERENCE_GUIDE.md
└── docs/
```

## Key Areas

- Basic assembly examples for file I/O, arguments, and arithmetic.
- Algorithm examples including two-sum and binary search.
- Python and C wrapper experiments for assembly integration.
- Reference material for learning FASM faster.

## Getting Started

Install FASM:

```bash
sudo apt-get install fasm
```

Build an example:

```bash
fasm mycat.asm
chmod +x mycat
./mycat
```

## Documentation

- [AI FASM Rules](AI_FASM_RULES.md)
- [FASM Reference Guide](FASM_REFERENCE_GUIDE.md)
- GitHub Pages handbook in `docs/`

## Debugging

- GDB frontend: <https://github.com/nakst/gf>
- Use `int3` in code to set a breakpoint.
- Use `readelf -h BINARY` to inspect the ELF entry point.

![elf](https://github.com/kroq86/fasm-handbook/assets/29804069/222c37f7-8bb2-4a23-bbbd-8e3167d446c4)

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE).
