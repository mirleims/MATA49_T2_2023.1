; Erick Suzart

section .text
    global dividir

dividir:
    push rbp            ; Salvar o ponteiro base
    mov rbp, rsp        ; Definir o ponteiro base para o ponteiro atual da pilha 
    divss xmm0, xmm1    ; Divide os dois números float e armazena o resultado em xmm0

end:
    mov rsp, rbp        ; Restaurar o ponteiro da pilha
    pop rbp             ; Restaurar o ponteiro base
    ret                 ; Retornar, o resultado está em XMM0
