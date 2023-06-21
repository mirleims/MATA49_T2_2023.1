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

Não houve diferença significativa entre os tempos de execução das duas funções. Ambas tiveram o mesmo tempo de execução, o que sugere que os dois códigos gerados pelo compilador são equivalentes. O mesmo não pôde ser dito para a função fatorial (questão 4), onde a função em assembly foi mais rápida que a função em C.

## Autoria

Erick Suzart
