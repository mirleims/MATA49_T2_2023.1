section .data
    arrey db "a","b","c","d","e"
    n db 4
    
section .bss
    num resb 1

section .text
    global _start

_print:
    .loop:

        mov rbx, [arrey+rax]
        mov [num], rbx

        push rax

        mov rax, 1
        mov rdi, 1
        mov rsi, num
        mov rdx, 1
        syscall

        pop rax
        dec rax

        cmp rax, 0
        jl .end

        jmp .loop
        ret
    .end:
        ret
        
_start:
    mov rax, [n]
    call _print

    mov rdi, 0
    mov rax, 60
    syscall