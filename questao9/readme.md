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

> OBS.: O programa aceita apenas a entrada de números positivos de dois dígitos.