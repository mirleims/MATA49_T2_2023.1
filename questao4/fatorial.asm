; Erick Suzuart, Paloma Arize

section .text
    global fatorial_asm

fatorial_asm:
    push rbp            ; Salvar o ponteiro base
    mov rbp, rsp        ; Definir o ponteiro base para o ponteiro atual da pilha 
    mov ecx, [rbp + 16] ; Mover o primeiro parâmetro (n) da pilha para ECX
    mov eax, ecx        ; Copiar n para EAX

main_loop:
    cmp ecx, 1          ; Comparar ECX a 1
    jle loop_end        ; Se ECX for menor ou igual a 1, pule para loop_end 
    dec ecx             ; Decrementar ECX e armazenar o resultado em ECX
    mul ecx             ; Multiplicar ECX por EAX e armazenar o resultado em EAX
    jmp main_loop

loop_end:
    mov rsp, rbp        ; Restaurar o ponteiro da pilha
    pop rbp             ; Restaurar o ponteiro base
    ret                 ; Retornar, o resultado está em EAX
