; Vinicius Reis Ferreira
; Leandro dos Santos Gama
; Isaac Pereira da Conceição Araujo

section .bss
    digitSpace      resb        100
    digitSpacePos   resb        8
    
    input_len       equ         10        
    input           resb        input_len
 
section .data
    mensagem        db          "DIGITE PARA ENCONTRAR A AREA - ex: R10 ou D10", 10
    mensagem_len    equ         $ - mensagem
    PI              equ 314
    R               equ 82       
    D               equ 68
    
section .text
    global _start
 
_start:
    ; Exibe o texto1 no terminal
    mov rdx, mensagem_len
    mov rsi, mensagem
    mov rdi, 1
    mov rax, 1
    syscall
    
    ; Solicita a entrada do usuário
    mov rdx, input_len
    mov rsi, input
    mov rdi, 0
    mov rax, 0
    syscall        
    
    call string_to_int              ; Converte os números da string input e armazena em rax
    push rax                        ; Envia rax para a pilha
    
    ; Compara o valor do primeiro caracter e caso R, calcula a área pelo calc_raio
    mov rax, input
    movzx rbx, byte [rax]
    mov rax, rbx
    mov rcx, R
    
    cmp rax, rcx
    je calc_raio

    ; Compara o valor do primeiro caracter e caso D, calcula a área pelo calc_diametro
    mov rax, input
    movzx rbx, byte [rax]
    mov rax, rbx
    mov rcx, D
    
    cmp rax, rcx
    je calc_diametro
    
exit:
    mov rax, 60 
    xor rdi, rdi
    syscall
    
; --------------------------------------------------------   
string_to_int:
    xor rax, rax 
    mov rcx, input 
    
    ; Converte cada um dos bytes do input para inteiro
    convert_loop:
        movzx rdx, byte [rcx]
        test rdx, rdx                       ; Verifica se ainda há bytes para conversão
        jz convert_done
        
        inc rcx 
        
        cmp rdx, 48                         ; Limite inferior para os números em ASCII := 0
        jl convert_loop
        
        cmp rdx, 57                         ; Limite superior para os números em ASCII := 9
        jg convert_loop
        
        sub rdx, 48 
                
        add rax, rax
        lea rax, [rax+rax*4]
        add rax, rdx
        jmp convert_loop

convert_done:
    ret

; --------------------------------------------------------   
calc_raio:
    pop rax
    
    mul rax

    mov rbx, PI
    mul rbx
    mov rbx, 100
    div rbx

    call print_RAX
    ret
        
calc_diametro:
    pop rax
    
    mov rbx, 2
    div rbx
    
    mul rax

    mov rbx, PI
    mul rbx
    mov rbx, 100
    div rbx
    
    call print_RAX
    ret

; --------------------------------------------------------   
print_RAX:
    mov rcx, digitSpace
    mov rbx, 10
    mov [rcx], rbx
    inc rcx
    mov [digitSpacePos], rcx
    
    int_to_string:                          ; Converte cada número para seu correspondente em ASCII
        mov rdx, 0
        mov rbx, 10
        div rbx
        push rax
        add rdx, 48
        
        mov rcx, [digitSpacePos]
        mov [rcx], dl
        inc rcx
        mov [digitSpacePos], rcx
        
        pop rax
        cmp rax, 0
        jne int_to_string
        
        
print_valor:
    mov rcx, [digitSpacePos]
 
    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall
 
    mov rcx, [digitSpacePos]
    dec rcx
    mov [digitSpacePos], rcx
 
    cmp rcx, digitSpace
    jge print_valor
    ret