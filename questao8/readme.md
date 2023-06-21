<!-- Desenvolvido por: Juvenal Bruno & Eliel Batista -->

<!-- Ordenador de vetores -->

Comandos para executar:

<!-- Gerar arquivo ordenar.o -->
nasm -f elf64 ordenar.asm

<!-- Gerar arquivo lib.o -->
gcc -c lib.c -o lib.o

<!-- Gerar arquivo executavel -->
gcc -o programa ordenar.o lib.o -no-pie