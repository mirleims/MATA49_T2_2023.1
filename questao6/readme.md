<!--  Autoria: Erick Suzuart, 2023 -->

# Como rodar

No diretório da questão, use o comando abaixo:

```bash
  bash run_script.sh
```

O script irá compilar todos os arquivos e executar o programa principal.

| OBS: O script foi testado apenas no Linux.

## Programa principal

O programa principal é o arquivo `main.c` que agrega duas funções distintas para calcular o enésimo número na sequência de Fibonacci.

As funções foram escritas em assembly (`fibonacci.asm`) e em C (`fibonacci.c`) e ambas são chamadas pelo programa principal o qual determina o tempo de execução de cada uma mostrando o resultado na tela.

## Resultados

Sem a otimização do compilador, a função em assembly é mais rápida que a função em C. Ao adicionar a otimização `-O3` do compilador, a função em C se tornou mais rápida que a função em assembly.

As vezes, ligar a otimização já é suficiente para que a função em C seja mais rápida que a função em assembly não sendo necessário reescrever a função em C para assembly.

## Autoria

Erick Suzart
