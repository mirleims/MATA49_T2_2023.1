section .text
    global somar

somar:
    push rbp                    ; Salvar o ponteiro base
    mov rbp, rsp                ; Definir o ponteiro base para o ponteiro atual da pilha 
    addss xmm0, xmm1            ; Somar os dois primeiros parâmetros

end:
    mov rsp, rbp                ; Restaurar o ponteiro da pilha
    pop rbp                     ; Restaurar o ponteiro base
    ret                         ; Retornar, o resultado está em XMM0
