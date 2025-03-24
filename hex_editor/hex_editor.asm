format ELF64 executable

include "../common.inc"

; Constants
BUFFER_SIZE equ BUFFER_MEDIUM    ; Use standard buffer size from common.inc
DISPLAY_WIDTH equ 16    ; Bytes per line
DISPLAY_HEIGHT equ 24   ; Lines per page
MAX_FILENAME equ 256    ; Maximum filename length

; Data segment
segment readable writeable
    ; File information
    file_name rb MAX_FILENAME    ; Buffer for filename
    file_size dq 0
    file_handle dq 0
    
    ; Buffer for file reading
    file_buffer rb BUFFER_SIZE
    
    ; Display buffer
    display_buffer rb 1024
    
    ; Error messages
    error_open db 'Error: Could not open file', 0xA, 0
    error_open_len = $ - error_open
    
    error_read db 'Error: Could not read file', 0xA, 0
    error_read_len = $ - error_read
    
    error_close db 'Error: Could not close file', 0xA, 0
    error_close_len = $ - error_close
    
    error_args db 'Error: No filename provided', 0xA, 0
    error_args_len = $ - error_args
    
    ; Format strings
    offset_fmt db '00000000: ', 0
    offset_fmt_len = $ - offset_fmt
    
    pipe_fmt db ' |', 0
    pipe_end_fmt db '|', 0xA, 0
    
    ; ASCII representation buffer
    ascii_buffer rb DISPLAY_WIDTH + 1
    
    ; Hex representation buffer
    hex_buffer rb DISPLAY_WIDTH * 3 + 1
    
    ; Newline for output
    line_break db 0xA, 0
    
    ; Separator for hex dump
    hex_separator db '  ', 0
    
    ; Space character - use a constant value
    SPACE_CHAR equ 32    ; ASCII space character

; Code segment
segment readable executable
entry main

main:
    ; Check command line arguments
    mov r8, [rsp + 16]    ; argv[1]
    test r8, r8
    jz .show_usage
    
    ; Copy filename to buffer
    mov rdi, file_name
    mov rsi, r8
    call str_copy
    
    ; Open file
    open_file file_name, O_RDONLY
    mov [file_handle], rax
    
    ; Get file size using lseek
    mov rax, SYS_lseek
    mov rdi, [file_handle]
    xor rsi, rsi    ; SEEK_END
    mov rdx, 2      ; SEEK_END
    syscall
    
    test rax, rax
    js .error_close
    
    mov [file_size], rax
    
    ; Reset file position to start
    mov rax, SYS_lseek
    mov rdi, [file_handle]
    xor rsi, rsi    ; SEEK_SET
    xor rdx, rdx    ; SEEK_SET
    syscall
    
    test rax, rax
    js .error_close
    
    ; Main display loop
    call display_file
    
    ; Close file
    close_file [file_handle]
    
    ; Exit successfully
    program_exit EXIT_SUCCESS

.show_usage:
    ; Print usage message
    syscall3 SYS_write, STDOUT, error_args, error_args_len
    program_exit EXIT_FAILURE

.error_open:
    handle_error error_open, error_open_len

.error_close:
    handle_error error_close, error_close_len

; Function: display_file
; Purpose: Display file contents in hex format
; Input:   file_handle - File descriptor
;         file_size - Total file size
; Output:  None
; Affects: RAX, RBX, RCX, RDX, RSI, RDI
display_file:
    function_start
    
    ; Initialize display
    xor rbx, rbx    ; Current position
    
.read_loop:
    ; Read chunk of file
    mov rax, SYS_read
    mov rdi, [file_handle]
    mov rsi, file_buffer
    mov rdx, BUFFER_SIZE
    syscall
    
    test rax, rax
    js .error_read
    jz .done
    
    ; Process buffer
    mov r12, rax    ; Save bytes read
    xor r13, r13    ; Offset within buffer
    
.line_loop:
    ; Clear buffers
    xor eax, eax
    mov rdi, hex_buffer
    mov rcx, DISPLAY_WIDTH * 3
    rep stosb
    
    mov rdi, ascii_buffer
    mov rcx, DISPLAY_WIDTH
    rep stosb
    
    ; Print offset
    mov rdi, STDOUT
    mov rsi, offset_fmt
    mov rdx, offset_fmt_len
    mov rax, SYS_write
    syscall
    
    ; Calculate bytes left in buffer
    mov r14, r12
    sub r14, r13
    cmp r14, DISPLAY_WIDTH
    jb .partial_line
    mov r14, DISPLAY_WIDTH
    
.partial_line:
    ; Process bytes for this line
    xor r15, r15    ; Index in line
    
.byte_loop:
    ; Check if we've processed all bytes for this line
    cmp r15, r14
    jae .print_line
    
    ; Get current byte
    mov al, [file_buffer + r13]
    
    ; Format hex value
    mov dl, al
    shr dl, 4
    cmp dl, 10
    jb .digit1
    add dl, 'A' - 10
    jmp .store1
.digit1:
    add dl, '0'
.store1:
    mov [hex_buffer + r15*3], dl
    
    mov dl, al
    and dl, 0Fh
    cmp dl, 10
    jb .digit2
    add dl, 'A' - 10
    jmp .store2
.digit2:
    add dl, '0'
.store2:
    mov [hex_buffer + r15*3 + 1], dl
    
    ; Add space
    mov byte [hex_buffer + r15*3 + 2], SPACE_CHAR
    
    ; Format ASCII value
    cmp al, 32
    jb .dot
    cmp al, 126
    ja .dot
    mov [ascii_buffer + r15], al
    jmp .next_byte
    
.dot:
    mov byte [ascii_buffer + r15], '.'
    
.next_byte:
    inc r15
    inc r13
    jmp .byte_loop
    
.print_line:
    ; Print hex values
    mov rax, SYS_write
    mov rdi, STDOUT
    mov rsi, hex_buffer
    mov rdx, r14
    add rdx, rdx    ; 2 chars per byte
    add rdx, r14    ; plus spaces
    syscall
    
    ; Print pipe
    mov rax, SYS_write
    mov rdi, STDOUT
    mov rsi, pipe_fmt
    mov rdx, 2
    syscall
    
    ; Print ASCII
    mov rax, SYS_write
    mov rdi, STDOUT
    mov rsi, ascii_buffer
    mov rdx, r14
    syscall
    
    ; Print pipe and newline
    mov rax, SYS_write
    mov rdi, STDOUT
    mov rsi, pipe_end_fmt
    mov rdx, 2
    syscall
    
    ; Check if we've processed all bytes in the buffer
    cmp r13, r12
    jb .line_loop
    
    ; Check if we've reached the end of the file
    cmp r12, BUFFER_SIZE
    jae .read_loop
    
.done:
    function_end
    ret

.error_read:
    syscall3 SYS_write, STDOUT, error_read, error_read_len
    function_end
    ret

; Function: str_copy
; Purpose: Copy string from source to destination
; Input:   RDI - Destination buffer
;         RSI - Source string
; Output:  None
; Affects: RAX, RCX, RDX, RSI, RDI
str_copy:
    function_start
    
    ; Save registers
    push rdi
    push rsi
    
    ; Get string length
    mov rdi, rsi
    call str_len
    mov rcx, rax    ; Length in RCX
    
    ; Restore registers
    pop rsi
    pop rdi
    
    ; Copy string
    rep movsb
    
    ; Null terminate
    mov byte [rdi], 0
    
    function_end
    ret

; Function: str_len
; Purpose: Calculate string length
; Input:   RDI - String pointer
; Output:  RAX - String length
; Affects: RAX, RCX, RDI
str_len:
    function_start
    
    xor rcx, rcx    ; Counter
    
.loop:
    cmp byte [rdi + rcx], 0
    je .done
    inc rcx
    jmp .loop
    
.done:
    mov rax, rcx
    
    function_end
    ret