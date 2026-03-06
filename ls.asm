format ELF64 executable

include "linux.inc"

SYS_open equ 2
SYS_getdents64 equ 217

O_RDONLY equ 0

buffer_size equ 8192

segment readable executable
entry main

main:
    ; argc is at [rsp], argv[0] at [rsp + 8], argv[1] at [rsp + 16]
    mov rax, [rsp]
    cmp rax, 2
    ja usage_error

    cmp rax, 1
    je use_current_dir

    mov rdi, [rsp + 16]
    jmp open_dir

use_current_dir:
    mov rdi, dot_dir

open_dir:
    mov rax, SYS_open
    mov rsi, O_RDONLY
    xor rdx, rdx
    syscall
    test rax, rax
    js open_error
    mov r12, rax

read_entries:
    mov rax, SYS_getdents64
    mov rdi, r12
    mov rsi, dir_buffer
    mov rdx, buffer_size
    syscall
    test rax, rax
    js read_error
    jz close_and_exit

    mov r13, rax
    xor r14, r14

next_entry:
    cmp r14, r13
    jae read_entries

    lea rbx, [dir_buffer + r14]
    movzx rcx, word [rbx + 16]   ; d_reclen
    test rcx, rcx
    jz close_and_exit

    lea rdi, [rbx + 19]          ; d_name
    cmp byte [rdi], '.'
    je skip_entry

    call print_line

skip_entry:
    add r14, rcx
    jmp next_entry

close_and_exit:
    syscall1 SYS_close, r12
    exit EXIT_SUCCESS

usage_error:
    syscall3 SYS_write, STDERR, usage_msg, usage_msg_len
    exit EXIT_FAILURE

open_error:
    syscall3 SYS_write, STDERR, open_err_msg, open_err_msg_len
    exit EXIT_FAILURE

read_error:
    syscall3 SYS_write, STDERR, read_err_msg, read_err_msg_len
    syscall1 SYS_close, r12
    exit EXIT_FAILURE

; rdi = zero-terminated string pointer
print_line:
    push rdi
    call strlen
    pop rdi
    mov rdx, rax
    mov rax, SYS_write
    mov rsi, rdi
    mov rdi, STDOUT
    syscall

    mov rax, SYS_write
    mov rdi, STDOUT
    mov rsi, newline
    mov rdx, 1
    syscall
    ret

; rdi = zero-terminated string pointer
; returns rax = length
strlen:
    xor rax, rax
.loop:
    cmp byte [rdi + rax], 0
    je .done
    inc rax
    jmp .loop
.done:
    ret

segment readable writeable

dot_dir db ".", 0
newline db 10

usage_msg db "usage: ./ls [directory]", 10
usage_msg_len = $ - usage_msg

open_err_msg db "error: failed to open directory", 10
open_err_msg_len = $ - open_err_msg

read_err_msg db "error: failed to read directory entries", 10
read_err_msg_len = $ - read_err_msg

dir_buffer rb buffer_size
