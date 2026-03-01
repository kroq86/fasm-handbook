# Vector Operations in FASM

This example shows how to expose assembly-implemented vector math to Python through a C wrapper.

## Files

- `dot_product.asm` implements the low-level numeric routines.
- `wrapper.c` exports C-callable symbols for Python.
- `vec.py` loads the shared library with `ctypes` and demonstrates cosine-style search over in-memory vectors.

## Build

```bash
fasm dot_product.asm dot_product.o
gcc -c wrapper.c -o wrapper.o -fPIC
gcc -shared -o mylib.so dot_product.o wrapper.o
```

## Run

```bash
python3 vec.py
```

## What It Demonstrates

- Calling FASM code from Python through a C bridge.
- Computing vector primitives in native code.
- Building a minimal in-memory vector search example around dot products and norms.

## Notes

- This directory is intentionally small and focused on vector math primitives.
- The previous DuckDB-specific README content did not match the actual files in this folder and was removed.
