; Juvenal Bruno
; Eliel Batista

section .data
    vetor dd 800, 50, 4, 1, 0           ; Definição do vetor com os valores iniciais
    tamanho equ ($ - vetor) / 4         ; Cálculo do tamanho do vetor em número de elementos

section .text
    global main
    extern bubbleSort, printVetor

main:
    sub rsp, 8                          ; Alinha a pilha antes da chamada da função

    lea rdi, [vetor]                    ; Carrega o endereço do vetor em rdi (1º argumento da função)
    mov rsi, tamanho                    ; Carrega o tamanho do vetor em rsi (2º argumento da função)
    call bubbleSort                     ; Chama a função bubbleSort
    add rsp, 8                          ; Restaura o valor da pilha

    sub rsp, 8                          ; Alinha a pilha antes da chamada da função
    lea rdi, [vetor]                    ; Carrega o endereço do vetor em rdi (1º argumento da função)
    mov rsi, tamanho                    ; Carrega o tamanho do vetor em rsi (2º argumento da função)
    call printVetor                     ; Chama a função printVetor

    add rsp, 8                          ; Restaura o valor da pilha

    mov rax, 60                         ; Chamada de sistema "exit"
    xor rdi, rdi                        ; Código de saída zero
    syscall
