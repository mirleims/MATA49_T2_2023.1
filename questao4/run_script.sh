# Erick Suzuart, Paloma Arize

nasm -f elf64 fatorial.asm -o fatorial.asm.o
gcc -m64 -c fatorial.c -o fatorial.c.o
gcc -m64 -c main.c -o main.c.o
gcc -m64 main.c.o fatorial.c.o fatorial.asm.o -o main_program.bin
./main_program.bin
