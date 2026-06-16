format ELF64 executable 3
include "core/platform.inc"

segment readable executable
entry start

start:
	write_file STDOUT, title, title_len
	write_file STDOUT, body, body_len
	exit 0

segment readable writeable
title db "Printing text", 10
title_len = $ - title
body db "A program speaks by writing bytes to an output stream.", 10
body_len = $ - body
