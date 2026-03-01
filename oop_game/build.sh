#!/bin/bash
set -e
cd "$(dirname "$0")"
fasm game.asm game.o
gcc -c wrapper.c -o wrapper.o -fPIC
gcc -shared -o mylib.so game.o wrapper.o
echo "Built mylib.so"
