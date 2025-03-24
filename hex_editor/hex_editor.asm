 format ELF64 executable

include "../common.inc"
include "../linux.inc"

; Constants
BUFFER_SIZE equ 4096    ; Page size for efficient reading
DISPLAY_WIDTH equ 16    ; Bytes per line
DISPLAY_HEIGHT equ 24   ; Lines per page

; Data segment
segment readable writeable
    ; File information
    file_name db 0
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
    
    ; Format strings
    hex_line_format db '%08x  %-48s  |%s|', 0xA, 0
    hex_line_format_len = $ - hex_line_format
    
    ; ASCII representation buffer
    ascii_buffer rb DISPLAY_WIDTH + 1
    
    ; Hex representation buffer
    hex_buffer rb DISPLAY_WIDTH * 3 + 1

; Code segment
segment readable executable
entry main

main:
    ; Check command line arguments
    mov r8, [rsp + 16]    ; argv[1]
    test r8, r8
    jz .show_usage
    
    ; Save filename
    mov [file_name], r8
    
    ; Open file
    mov rax, SYS_open
    mov rdi, r8
    mov rsi, O_RDONLY
    syscall
    
    test rax, rax
    js .error_open
    
    mov [file_handle], rax
    
    ; Get file size
    mov rax, SYS_fstat
    mov rdi, [file_handle]
    sub rsp, 144    ; Size of stat structure
    mov rsi, rsp
    syscall
    
    test rax, rax
    js .error_close
    
    mov rax, [rsp + 48]    ; st_size
    mov [file_size], rax
    add rsp, 144
    
    ; Main display loop
    call display_file
    
    ; Close file
    mov rax, SYS_close
    mov rdi, [file_handle]
    syscall
    
    test rax, rax
    js .error_close
    
    ; Exit successfully
    program_exit EXIT_SUCCESS

.show_usage:
    ; Print usage message
    mov rax, SYS_write
    mov rdi, STDOUT
    mov rsi, usage_msg
    mov rdx, usage_len
    syscall
    
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
    mov rcx, rax    ; Bytes read
    mov rsi, file_buffer
    
.process_byte:
    ; Convert byte to hex
    movzx eax, byte [rsi]
    mov rdi, hex_buffer
    call byte_to_hex
    
    ; Convert to ASCII
    movzx eax, byte [rsi]
    mov rdi, ascii_buffer
    call byte_to_ascii
    
    inc rsi
    dec rcx
    jnz .process_byte
    
    ; Print line
    mov rax, SYS_write
    mov rdi, STDOUT
    mov rsi, hex_line_format
    mov rdx, hex_line_format_len
    syscall
    
    jmp .read_loop
    
.done:
    function_end
    ret

.error_read:
    handle_error error_read, error_read_len

; Function: byte_to_hex
; Purpose: Convert byte to hex string
; Input:   AL - Byte to convert
;         RDI - Buffer to store result
; Output:  RDI - Points to end of string
; Affects: RAX, RBX, RCX, RDX, RSI, RDI
byte_to_hex:
    function_start
    
    ; Convert high nibble
    movzx eax, al
    mov bl, al
    shr bl, 4
    call nibble_to_hex
    
    ; Convert low nibble
    mov bl, al
    and bl, 0Fh
    call nibble_to_hex
    
    function_end
    ret

; Function: nibble_to_hex
; Purpose: Convert nibble to hex character
; Input:   BL - Nibble to convert
;         RDI - Buffer to store result
; Output:  RDI - Points to next position
; Affects: RAX, RBX, RCX, RDX, RSI, RDI
nibble_to_hex:
    function_start
    
    cmp bl, 9
    ja .letter
    
    add bl, '0'
    jmp .store
    
.letter:
    add bl, 'A' - 10
    
.store:
    mov [rdi], bl
    inc rdi
    
    function_end
    ret

; Function: byte_to_ascii
; Purpose: Convert byte to ASCII representation
; Input:   AL - Byte to convert
;         RDI - Buffer to store result
; Output:  RDI - Points to next position
; Affects: RAX, RBX, RCX, RDX, RSI, RDI
byte_to_ascii:
    function_start
    
    cmp al, 32
    jb .dot
    cmp al, 126
    ja .dot
    
    mov [rdi], al
    jmp .done
    
.dot:
    mov byte [rdi], '.'
    
.done:
    inc rdi
    
    function_end
    ret