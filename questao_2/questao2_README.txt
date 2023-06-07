PARA RODAR O PROGRAMA, BASTA DIGITAR NO TERMINAL:

- gcc -c -m64 questao2_C.c
- nasm -f elf64 questao2.asm
- gcc -m64 -o questao2 questao2_C.o questao2.o -lm
- ./questao2