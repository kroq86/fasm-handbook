format ELF64 executable 3
include "core/platform.inc"

segment readable executable
entry start

start:
	write_file STDOUT, letters, letters_len
	exit 0

segment readable writeable
letters db 65, 66, 67, 10
letters_len = $ - letters
