#!/bin/bash
# Linux: bash run.sh
nasm -f elf64 -o questao10.o questao10.asm
gcc -no-pie -o questao10 questao10.o
./questao10