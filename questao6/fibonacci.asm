; Autoria: Erick Suzart Souza, 2023

section .text
    global fibonacci_asm

fibonacci_asm:
    push rbp            ; Salvar o ponteiro base
    mov rbp, rsp        ; Definir o ponteiro base para o ponteiro atual da pilha
    ; Inicializar as variáveis
    ; O primeiro parâmetro (n) está em [rbp + 16] para sistemas de 64 bits
    mov ecx, [rbp + 16] ; Mover o primeiro parâmetro (n) da pilha para ECX
    mov eax, 1          ; Inicializar EAX para armazenar o número atual de Fibonacci
    mov ebx, 1          ; Inicializar EBX para armazenar o número de Fibonacci anterior
    cmp ecx, 0          ; Verificar se n é zero
    je igual_a_zero     ; Se n for zero, pular para igual_a_zero
    cmp ecx, 1          ; Comparar ECX com 1
    jle fim_loop        ; Se ECX for menor ou igual a 1, pular para fim_loop
    dec ecx             ; Decrementar ECX e armazenar o resultado em ECX
    jmp main_loop       ; Pular para main_loop

igual_a_zero:
    mov eax, 0          ; Definir EAX como 0
    jmp fim_loop        ; Pular para fim_loop

main_loop:
    add eax, ebx        ; Adicionar o número de Fibonacci anterior (ebx) ao número atual (eax)
    xchg eax, ebx       ; Trocar os valores de eax e ebx
    dec ecx             ; Decrementar ECX e armazenar o resultado em ECX
    jnz main_loop       ; Se ECX não for zero, pular para main_loop

fim_loop:
    mov rsp, rbp        ; Restaurar o ponteiro da pilha
    pop rbp             ; Restaurar o ponteiro base
    ret                 ; Retornar, o resultado está em EAX
