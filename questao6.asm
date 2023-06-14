; Dupla: Helen Amanda Lima de Freitas e Maria Fernanda Pinto da Fonseca

section .data
    array db 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 0
    msg db "Valor nao esta na sequencia analisada.", 0
    var dq 0
    sum_previous dq 0
    lenmsg equ $-msg

section .text
extern printf, scanf
global main

format_in db "%d", 0
format_out db "%d", 10, 0

main:
    sub rsp, 8
    lea rdi, [format_in]
    lea rsi, [var]
    xor eax, eax
    call scanf
    add rsp, 8

    mov eax, 0
    mov bl, byte [var]

.loop:
    cmp byte [array + rax], 0
    je end
    cmp byte [array + rax], bl
    je find

    mov dl, byte [array + rax]
    add byte [sum_previous], dl

    inc rax
    jmp .loop

find:
    mov rdi, format_out
    mov rsi, [sum_previous]
    xor eax, eax
    call printf
    xor eax, eax
    ret

end:
    mov rdi, msg
    xor eax, eax
    call printf
    xor eax, eax
    ret
