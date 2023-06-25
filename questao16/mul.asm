; Erick Suzart

section .text
    global multiplicar

multiplicar:
    push rbp            ; Salvar o ponteiro base
    mov rbp, rsp        ; Definir o ponteiro base para o ponteiro atual da pilha 
    mulss xmm0, xmm1    ; Multiplica os dois números float e armazene o resultado em xmm0

end:
    mov rsp, rbp        ; Restaurar o ponteiro da pilha
    pop rbp             ; Restaurar o ponteiro base
    ret                 ; Retornar, o resultado está em XMM0
