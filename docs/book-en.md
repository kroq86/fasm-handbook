---
title: Handbook EN
permalink: /book-en/
---

# FASM Reference Guide

This page adapts the repository reference into a GitHub Pages handbook format.

## 1. Program Structure

```nasm
format ELF64 executable
entry main
```

- Use `format ELF64 executable` for Linux executables.
- Keep segments explicit and predictable.

```nasm
segment readable writeable
segment readable executable
```

## 2. System Calls

```nasm
SYS_read  equ 0
SYS_write equ 1
SYS_close equ 3
SYS_exit  equ 60
```

- `RAX` holds the syscall number.
- `RDI`, `RSI`, `RDX`, `R10`, `R8`, `R9` hold arguments in that order.

## 3. File Operations

```nasm
mov rax, 2
mov rdi, filename
mov rsi, 0
syscall
```

- Check syscall return values immediately.
- Negative values indicate an error on Linux.

## 4. Data And Memory

```nasm
file_handle dq 0
filename db 'lol.txt', 0
buffer_size equ 1024
buffer rb buffer_size
```

- Declare constants first.
- Keep strings zero-terminated.
- Reserve buffers explicitly with `rb`, `rw`, `rd`, or `rq`.

## 5. Function Helpers

```nasm
macro funcall1 func, a
{
    mov rdi, a
    call func
}
```

- Wrapper macros reduce boilerplate.
- Still preserve registers carefully when building reusable routines.

## 6. Register Conventions

- `RAX` is used for syscall numbers and return values.
- `RDI`, `RSI`, `RDX`, `RCX` commonly carry parameters.
- `RAX`, `RCX`, `RDX`, `R8` to `R11` should be treated as volatile.

## 7. Error Handling

```nasm
syscall
test rax, rax
js error_handler
```

- Test after every syscall that can fail.
- Centralize cleanup in one error path when possible.

## 8. Common Pattern: Read Loop

```nasm
read_loop:
    mov rax, SYS_read
    mov rdi, [file_handle]
    mov rsi, buffer
    mov rdx, buffer_size
    syscall
```

- This is the core pattern behind `mycat.asm`.
- Follow it with zero-byte EOF handling and error checks.

## 9. Number Printing Tricks

The repository includes compact arithmetic techniques, especially in `fib.asm`, for converting integers into ASCII digits efficiently.

## 10. Optimization Notes

- Prefer registers over memory traffic.
- Keep stack alignment at 16 bytes before calls.
- Use simple flag-based tests such as `test rax, rax` when appropriate.

## 11. Debugging

- Insert breakpoints with `int3` when needed.
- Use `readelf -h <binary>` to inspect ELF entry details.
- A graphical frontend such as `gf` can make GDB easier to navigate.

## 12. Related Material

- [English overview]({{ '/en/' | relative_url }})
- [Russian handbook]({{ '/book-ru/' | relative_url }})
- `AI_FASM_RULES.md`
