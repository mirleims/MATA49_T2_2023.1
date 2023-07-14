# Erick Suzuart

nasm -f elf64 sum.asm -o sum.asm.o
nasm -f elf64 sub.asm -o sub.asm.o
nasm -f elf64 mul.asm -o mul.asm.o
nasm -f elf64 div.asm -o div.asm.o
gcc -m64 -Wall -c main.c -o main.c.o
gcc -m64 main.c.o sum.asm.o sub.asm.o mul.asm.o div.asm.o -o main.bin
./main.bin

