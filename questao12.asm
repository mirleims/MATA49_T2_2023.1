; Beatriz Bacelar, Alexandre Carvalho

max equ 3
min equ 2 
atu equ 1

section .data
    msg1 db 'Digite a quantidade atual em estoque: '
    len1 equ $ - msg1
    msg2 db 'Digite a quantidade maxima em estoque: '
    len2 equ $ - msg2
    msg3 db 'Digite a quantidade minima em estoque: '
    len3 equ $ - msg3
    msg4 db 'Nao efetuar compra', 0AH
    len4 equ $ - msg4
    msg5 db 'Efetuar compra', 0AH
    len5 equ $ - msg5

section .bss
    atual resb 4
    maxima resb 4
    minima resb 4
    media resb 4

section .text
global _start

_start:

    ; lê quantidade atual em estoque
    mov rsi, msg1
    mov rdx, len1
    call print_msg
    mov rsi, atual
    call ler_value
    
    ; lê quantidade maxima em estoque
    mov rsi, msg2
    mov rdx, len2
    call print_msg
    mov rsi, maxima
    call ler_value
    
    ; lê quantidade minima possivel de se ter em estoque
    mov rsi, msg3
    mov rdx, len3
    call print_msg
    mov rsi, minima
    call ler_value

    call analisa_media


calc_media:
    mov eax,max
    add eax,min     ;  soma da maxima e minimo pra calcular a media
    mov [media],eax

                     ; soma da atual com ela propria 
    mov eax,atu  ; 
    add eax, eax     ; 
    mov [atual],eax  ;
    ret
    
comparador:
    mov rax,[media] 
    mov rbx,[atual]
    cmp rax,rbx
    jg print_comprar
    
    call print_nao_comprar
    


analisa_media:
    call calc_media
    call comparador
    ret


ler_value: 
    mov rax, 0
    mov rdi, 0
    mov rdx, 4
    syscall
    ret
    
print_msg:
    mov rax, 1
    mov rdi, 1
    syscall
    ret
    
print_nao_comprar:
    mov rsi, msg4
    mov rdx, len4
    call print_msg
    call fim
    
print_comprar:
    mov rsi, msg5
    mov rdx, len5
    call print_msg
    call fim
    
fim:

    mov rax, 60
    xor rdi,rdi
    syscall
