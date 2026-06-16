format ELF64 executable 3
include "core/platform.inc"

segment readable executable
entry start

start:
	mov	rsi, msg
	mov	rdx, msg_len
	write_file STDOUT, rsi, rdx
	exit 0

segment readable writeable
msg db "Registers remember tiny things", 10
msg_len = $ - msg
