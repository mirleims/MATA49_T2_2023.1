; Erick Suzuart

section .text
    global subtrair

subtrair:
    push rbp            ; Salvar o ponteiro base
    mov rbp, rsp        ; Definir o ponteiro base para o ponteiro atual da pilha 
    subss xmm0, xmm1    ; Subtrair os dois números de ponto flutuante recebidos

end:
    mov rsp, rbp        ; Restaurar o ponteiro da pilha
    pop rbp             ; Restaurar o ponteiro base
    ret                 ; Retornar, o resultado está em EAX
