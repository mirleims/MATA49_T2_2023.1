; Questão 10
; Leia três pontos, calcule a distância entre os pontos e, 
; teste se: o triângulo é equilátero, isósceles , ou escaleno.

; Equipe: 
;         Bruno de Lucas
;         Elis Alcantara
;         Monique Silva

extern printf
extern scanf
extern sqrt
extern pow

section .data
  ; Mensagem inicial
  mensagem db 'Insira a coordenada para os pontos A, B e C: ', 10
  tam equ $-mensagem

  ; Mensagens para leitura das coordenadas
  msg_A db 'Coordenada A', 10
  tam_A equ $-msg_A

  msg_B db 'Coordenada B', 10
  tam_B equ $-msg_B

  msg_C db 'Coordenada C', 10
  tam_C equ $-msg_C

  ; Mensagens para o resultado
  msg_equilatero db 'O triangulo eh equilatero', 10
  tam_equilatero equ $-msg_equilatero

  msg_isosceles db 'O triangulo eh isosceles', 10
  tam_isosceles equ $-msg_isosceles

  msg_escaleno db 'O triangulo eh escaleno', 10
  tam_escaleno equ $-msg_escaleno

  ; Imprimir linha em branco "\n"
  nova_linha db 10

  ; Variáveis para cálculo da distância em ponto flutuante
  x1 dq 0.0
  y1 dq 0.0
  x2 dq 0.0
  y2 dq 0.0
  x3 dq 0.0
  y3 dq 0.0

  ; Formato para escrita de entrada ou saída
  fmt_input db "%lf", 0
  fmt_distancia db "%lf", 10, 0

  ; Variáveis da distância
  distanciaAB dq 0.0 ; distncia entre A e B
  distanciaAC dq 0.0 ; distncia entre A e C
  distanciaBC dq 0.0 ; distncia entre B e C

section .text
global main

  ; Funções auxiliares
  ; Calcular a distância entre dois pontos
  ; Fórmula => √((x2 - x1)^2 + (y2 - y1)^2)
calc_distancia:
  ; Calcular primeira expressão => (x2 - x1)^2
  movsd xmm3, xmm6
  subsd xmm3, xmm1
  mulsd xmm3, xmm3

  ; Calcular segunda expressão => (y2 - y1)^2
  movsd xmm4, xmm7
  subsd xmm4, xmm2
  mulsd xmm4, xmm4

  ; Calcular soma => (x2 - x1)^2 + (y2 - y1)^2
  addsd xmm3, xmm4

  ; Calcular raiz quadrada => sqrt((x2 - x1)^2 + (y2 - y1)^2)
  sqrtsd xmm0, xmm3

  ret

  ; Imprimir a mensagem do resultado
triangulo_isosceles:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg_isosceles
  mov rdx, tam_isosceles
  syscall
  call exit
  ret

triangulo_escaleno:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg_escaleno
  mov rdx, tam_escaleno
  syscall
  call exit
  ret

triangulo_equilatero:
  mov rax, 1
  mov rdi, 1
  mov rsi, msg_equilatero
  mov rdx, tam_equilatero
  syscall
  call exit
  ret

  ; Verificar se o triângulo é equilatero
verificar_equilatero_aux:
  ucomisd xmm1, xmm2
  je triangulo_equilatero
  ret
  
verificar_equilatero:
  ucomisd xmm0, xmm2
  je verificar_equilatero_aux
  ret

  ; Encerrar o programa
exit:
  mov rsp, rbp
  pop rbp
  ret

main:
  push rbp
  mov rbp, rsp

  ; Imprimir mensagem inicial
  mov rax, 1
  mov rdi, 1
  mov rsi, mensagem
  mov rdx, tam
  syscall

  mov rax, 1
  mov rdi, 1
  mov rsi, nova_linha
  mov rdx, 1
  syscall

  ; Imprime mensagem e lê coordenadas do ponto A
  mov rax, 1
  mov rdi, 1
  mov rsi, msg_A
  mov rdx, tam_A
  syscall

  mov rdi, fmt_input
  mov rsi, x1
  call scanf

  mov rdi, fmt_input
  mov rsi, y1
  call scanf

  mov rax, 1
  mov rdi, 1
  mov rsi, nova_linha
  mov rdx, 1
  syscall

  ; Imprime mensagem e lê coordenadas do ponto B
  mov rax, 1
  mov rdi, 1
  mov rsi, msg_B
  mov rdx, tam_B
  syscall

  mov rdi, fmt_input
  mov rsi, x2
  call scanf

  mov rdi, fmt_input
  mov rsi, y2
  call scanf

  mov rax, 1
  mov rdi, 1
  mov rsi, nova_linha
  mov rdx, 1
  syscall

  ; Imprime mensagem e lê coordenadas do ponto C
  mov rax, 1
  mov rdi, 1
  mov rsi, msg_C
  mov rdx, tam_C
  syscall

  mov rdi, fmt_input
  mov rsi, x3
  call scanf

  mov rdi, fmt_input
  mov rsi, y3
  call scanf

  mov rax, 1
  mov rdi, 1
  mov rsi, nova_linha
  mov rdx, 1
  syscall

  ; Calcular a distancia entre os pontos A e B
  movsd xmm1, qword [x1]
  movsd xmm2, qword [y1]
  movsd xmm6, qword [x2]
  movsd xmm7, qword [y2]
  call calc_distancia
  mov rdi, fmt_distancia
  movsd xmm0, xmm0
  movsd [distanciaAB], xmm0
  call printf

  ; Calcular a distancia entre os pontos A e C
  movsd xmm1, qword [x1]
  movsd xmm2, qword [y1]
  movsd xmm6, qword [x3]
  movsd xmm7, qword [y3]
  call calc_distancia
  mov rdi, fmt_distancia
  movsd xmm0, xmm0
  movsd [distanciaAC], xmm0
  call printf

  ; Calcular a distancia entre os pontos B e C
  movsd xmm1, qword [x2]
  movsd xmm2, qword [y2]
  movsd xmm6, qword [x3]
  movsd xmm7, qword [y3]
  call calc_distancia
  mov rdi, fmt_distancia
  movsd xmm0, xmm0
  movsd [distanciaBC], xmm0
  call printf
 
  ; Tipo do triângulo
  ; Verificar se é equilátero
  movsd xmm0, qword [distanciaAB]
  movsd xmm1, qword [distanciaAC] 
  movsd xmm2, qword [distanciaBC]
  
  ucomisd xmm0, xmm1
  je verificar_equilatero

  ; Verificar se é isósceles ou escaleno
  movsd xmm0, qword [distanciaAB]
  movsd xmm1, qword [distanciaAC] 
  movsd xmm2, qword [distanciaBC]

  ucomisd xmm0, xmm1
  je triangulo_isosceles
  
  ucomisd xmm0, xmm2
  je triangulo_isosceles
  
  ucomisd xmm1, xmm2
  je triangulo_isosceles

  jmp triangulo_escaleno

  ; Encerrar programa
  call exit
  