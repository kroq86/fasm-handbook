format ELF64 executable 3
include "core/platform.inc"

segment readable executable
entry start

start:
	write_file STDOUT, msg, msg_len
	exit 0

segment readable writeable
msg db "Hello, FASM", 10
msg_len = $ - msg
