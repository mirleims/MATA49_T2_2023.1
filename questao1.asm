; Dupla: Lucas de Araújo Santos Oliveira e Matheus Nascimento de Almeida

section .data
str1   db  "Digite a primeira altura: ",10,0
str2   db  "Digite a segunda altura: ",10,0
str3   db  "Digite a terceira altura: ",10,0
str4   db  "Digite a quarta altura: ",10,0
str5   db  "A média é %.2f",10,0

fmt  db  "%lf"

n1   dq 0.0
n2   dq 0.0
n3   dq 0.0
n4   dq 0.0

section .bss
res resq 1

section .text
global main
extern printf, scanf

main:
    push    rbp
    mov     rbp, rsp

    mov     rdi, str1
    mov     rax, 0
    call    printf

    mov     rdi, fmt
    mov     rsi, n1
    mov     rax, 0
    call    scanf

    mov     rdi, str2
    mov     rax, 0
    call    printf

    mov     rdi, fmt
    mov     rsi, n2
    mov     rax, 0
    call    scanf

    mov     rdi, str3
    mov     rax, 0
    call    printf

    mov     rdi, fmt
    mov     rsi, n3
    mov     rax, 0
    call    scanf

    mov     rdi, str4
    mov     rax, 0
    call    printf

    mov     rdi, fmt
    mov     rsi, n4
    mov     rax, 0
    call    scanf

    movsd   xmm0, [n1]
    addsd   xmm0, [n2]
    addsd   xmm0, [n3]
    addsd   xmm0, [n4]

    mov   rax, 4
    cvtsi2sd xmm1, rax
    divsd   xmm0, xmm1

    movsd   [res], xmm0

    mov     rdi, str5
    mov     rax, fmt
    call    printf

    leave
    mov     rax, 0
    ret