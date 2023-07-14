; Erick Suzuart

; Funções padrão do C
extern printf, scanf

; Funções assembly externas
extern somar, subtrair, multiplicar, dividir

section .data
  ; mensgagem para leitura do primeiro numero
  pnum_msg db 'Digite o primeiro número: ', 10

  ; mensgagem para leitura do segundo numero
  snum_msg db 'Digite o segundo número: ', 10

  ; mensgagem para leitura do terceiro numero
  op_msg db 'Digite a operação (1 - soma, 2 - subtração, 3 - multiplicação, 4 - divisão): ', 10

  ; mensgagem de erro
  erro_msg db 'Não é possível dividir por zero!', 10

  ; formatos para leitura de números
  float_fmt db "%lf", 0
  int_fmt db "%d", 0

  ; mensgagem para exibição do resultado
  res_msg db 'O resultado é: %.2f', 10

  ; variável float para armazenar o resultado da operação
  numero1 dq 0.0
  numero2 dq 0.0
  resultado dq 0.0
  zero dq 0.0
  operacao dd 0

section .text
  global main

soma:
  ; chamada da função soma
  push numero2
  push numero1
  call somar

  ; limpeza da pilha
  add esp, 8

  ; armazenamento do resultado
  movss [resultado], xmm0
  ret

subtracao:
  ; chamada da função subtrair
  push numero2
  push numero1
  call subtrair
  add esp, 8

  ; armazenamento do resultado
  movss [resultado], xmm0
  ret

multiplicacao:
  ; chamada da função multiplicar
  push numero2
  push numero1
  call multiplicar

  ; limpeza da pilha
  add esp, 8

  ; armazenamento do resultado
  movss [resultado], xmm0
  ret

divisao:
  ; chamada da função dividir
  movss xmm0, [numero2]
  movss xmm1, [zero]
  ucomisd xmm0, xmm1
  je erro_divisao

  ;the last parameter to pass is the first one pushed, and the first parameter
  ;to pass is the last one pushed
  push numero2
  push numero1
  call dividir

  ; limpeza da pilha
  add esp, 8

  ; armazenamento do resultado
  movss [resultado], xmm0
  ret

erro_divisao:
  ; exibição de erro
  mov rdi, erro_msg
  mov eax, 0
  call printf

  jmp exit

main:
  ; leitura do primeiro número
  mov rdi, pnum_msg
  mov eax, 0
  call printf

  mov rdi, float_fmt
  mov rsi, numero1
  mov eax, 0
  call scanf

  ; leitura do segundo número
  mov rdi, snum_msg
  mov eax, 0
  call printf

  mov rdi, float_fmt
  mov rsi, numero2
  mov eax, 0
  call scanf

  ; leitura da operação
  mov rdi, op_msg
  mov eax, 0
  call printf

  mov rdi, int_fmt
  mov rsi, operacao
  mov eax, 0
  call scanf

  ; chamada da subrotina de acordo com a operação
  mov eax, operacao
  cmp eax, 1
  je soma
  cmp eax, 2
  je subtracao
  cmp eax, 3
  je multiplicacao
  cmp eax, 4
  je divisao

  ; exibição do resultado
  mov rdi, res_msg
  mov rsi, resultado
  mov eax, 0
  call printf

; saída do programa
exit:
  mov eax, 0
  ret