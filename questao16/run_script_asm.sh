# Erick Suzuart

nasm -f elf64 sum.asm -o sum.asm.o
nasm -f elf64 sub.asm -o sub.asm.o
nasm -f elf64 mul.asm -o mul.asm.o
nasm -f elf64 div.asm -o div.asm.o
nasm -f elf64 main.asm -o main.asm.o
ld -pie sub.asm.o sum.asm.o mul.asm.o div.asm.o main.asm.o -o main.bin

./main.bin

