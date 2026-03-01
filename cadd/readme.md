# C Addition Example

This directory contains the smallest C-to-Python shared-library example in the repository.

## Files

- `add.c` implements the addition function in C.
- `add.py` loads the resulting shared library with `ctypes`.
- `run.sh` builds the shared library.

## Build

```bash
sh run.sh
```

## Run

```bash
python3 add.py
```

## Why It Exists

This example is useful as a baseline before moving to the FASM-backed wrapper examples in `add/`, `vec/`, `coroutines/`, and `oop_game/`.
