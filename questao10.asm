; Questão 10
; Leia três pontos, calcule a distância entre os pontos e, 
; teste se: o triângulo é equilátero, isósceles , ou escaleno.

; Equipe: 
;         Bruno de Lucas
;         Elis Alcantara
;         Monique Silva

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

  msg_nao_triangulo db 'Nao eh um triangulo', 10
  tam_nao_triangulo equ $-msg_nao_triangulo

  ; Imprimir linha em branco "\n"
  nova_linha db 10

section .bss
  ; Variáveis para armazenar as coordenadas
  x1 resq 1
  y1 resq 1
  x2 resq 1
  y2 resq 1
  x3 resq 1
  y3 resq 1

section .text
	global _start

_start:
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

	mov rax, 0
  mov rdi, 0
  mov rsi, x1
  mov rdx, 8
  syscall

  mov rax, 0
  mov rdi, 0
  mov rsi, y1
  mov rdx, 8
  syscall

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

  mov rax, 0
  mov rdi, 0
  mov rsi, x2
  mov rdx, 8
  syscall

  mov rax, 0
  mov rdi, 0
  mov rsi, y2
  mov rdx, 8
  syscall

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

  mov rax, 0
  mov rdi, 0
  mov rsi, x3
  mov rdx, 8
  syscall

  mov rax, 0
  mov rdi, 0
  mov rsi, y3
  mov rdx, 8
  syscall

  mov rax, 1
  mov rdi, 1
  mov rsi, nova_linha
  mov rdx, 1
  syscall

  ; ---- To-do ----
  ; Calcular a distância entre os pontos
  ; Distância entre A e B
  ; Distância entre A e C
  ; Distância entre B e C

  ; Testa se é um triângulo
  ; Se não for, imprime mensagem e finaliza o programa

  ; Testa se é equilátero e imprime mensagem
  ; Testa se é isósceles e imprime mensagem
  ; Testa se é escaleno e imprime mensagem

  ; Finaliza o programa
	mov rax, 60
	xor rdi, rdi
	syscall
