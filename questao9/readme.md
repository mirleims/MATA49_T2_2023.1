# Como rodar

Executar os seguintes comandos dentro desse repositório:
```
nasm -f elf64 tipos_de_triangulo.asm
gcc tipos_de_triangulo.o -o tipos_de_triangulo -no-pie
./tipos_de_triangulo
```
Após isso, digite os três lados do triângulo (**cada lado** seguido de um *enter/return*).

# Como funciona o programa

O programa desenvolvido em assembly retorna o tipo de triângulo, dado 3 lados enviados pelo usuário.

1. Primeiro ele recebe as tres entrada via terminal;
2. Logo depois verifica se os lados lidos compõem de fato um triângulo (desigualdade triangular);
3. Por último ele verifica qual o tipo de triângulo (isósceles, escaleno ou retangular).

> OBS.: O programa, inicialmente, está configurado para receber apenas números naturais de 1 dígito. Se desejar aumentar  a quantidade de dígitos de entrada, você deve alterar *WORD_SIZE equ 2* para a quantidade desejada somado de 1, ou seja, se quiser uma entrada de 3 dígitos, você deve colocar *WORD_SIZE equ 4*. Além disso, é imprescindível que a entrada tenha sempre a quantidade de dígitos estipulada, logo, se a entrada for de dois dígitos, o número **9** deve ser entrado como **09**.

# Autores
Felipe Freire, Lucas Souza, Vinicius Coutinho
