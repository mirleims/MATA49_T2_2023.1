# Erick Suzuart

nasm -f elf64 fibonacci.asm -o fibonacci.asm.o
gcc -m64 -O3 -c fibonacci.c -o fibonacci.c.o
gcc -m64 -c main.c -o main.c.o
gcc -m64 -O3  main.c.o fibonacci.asm.o fibonacci.c.o -o main_program.bin
./main_program.bin
