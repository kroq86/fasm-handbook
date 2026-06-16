format ELF64 executable 3
include "core/platform.inc"

segment readable executable
entry start

start:
	mov	rbx, rsp
	cmp	qword [rbx], 1
	jne	usage
	write_file STDOUT, ok_msg, ok_len
	exit 0

usage:
	write_file STDERR, usage_msg, usage_len
	exit 2

segment readable writeable
ok_msg db "No arguments: success", 10
ok_len = $ - ok_msg
usage_msg db "usage: 03_exit_codes", 10
usage_len = $ - usage_msg
