; Erick Suzuart

section .text
    global subtrair

subtrair:
    push rbp            ; Salvar o ponteiro base
    mov rbp, rsp        ; Definir o ponteiro base para o ponteiro atual da pilha 
    movss xmm0, dword[rsp + 16] ; Recebe o primeiro parâmetro
    movss xmm1, dword[rsp + 20] ; Recebe o segundo parâmetro (float = 4 bytes)

    subss xmm0, xmm1            ; Subtrai os dois números float e armazene o resultado em xmm0
end:
    mov rsp, rbp        ; Restaurar o ponteiro da pilha
    pop rbp             ; Restaurar o ponteiro base
    ret                 ; Retornar, o resultado está em EAX
