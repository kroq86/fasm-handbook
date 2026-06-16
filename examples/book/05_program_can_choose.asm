format ELF64 executable 3
include "core/platform.inc"

segment readable executable
entry start

start:
	mov	rax, 7
	cmp	rax, 7
	jne	not_equal
	write_file STDOUT, yes_msg, yes_len
	exit 0

not_equal:
	write_file STDOUT, no_msg, no_len
	exit 1

segment readable writeable
yes_msg db "The program chose yes", 10
yes_len = $ - yes_msg
no_msg db "The program chose no", 10
no_len = $ - no_msg
