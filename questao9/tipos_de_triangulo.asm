section .data
    lado1 dq 0
    lado2 dq 0
    lado3 dq 0

    naotriangulo db 'Nao forma triangulo', 13, 10, 0
    tamanhoStr_naotriangulo equ $-naotriangulo

    escaleno db 'Escaleno', 13, 10, 0
    tamanhoStr_escaleno equ $-escaleno

    isoceles db 'Isoceles', 13, 10, 0
    tamanhoStr_isoceles equ $-isoceles

    equilatero db 'Equilatero', 13, 10, 0
    tamanhoStr_equilatero equ $-equilatero

section .bss
    input_lado1 resb 2
    input_lado2 resb 2
    input_lado3 resb 2

section .text
    global main

main:
    mov rbp, rsp; for correct debugging
    ;Ler lado 1
    mov rsi, input_lado1
    call ler_string
    mov rdi, rsi
    call string_to_int
    mov qword [lado1], rax

    ;Ler lado 2
    mov rsi, input_lado2
    call ler_string
    mov rdi, rsi
    call string_to_int
    mov qword [lado2], rax
    
    ;Ler lado 3
    mov rsi, input_lado3
    call ler_string
    mov rdi, rsi
    call string_to_int
    mov qword [lado3], rax

    jmp analisa_se_e_triangulo
    call tipo_de_triangulo

    jmp exit

analisa_se_e_triangulo: ;descobrir se os lados lidos compoem um triangulo
    ;l1 < l2 + l3
    ;l2 < l1 + l3
    ;l3 < l1 + l2

    .analise_lado1:
        mov rbx, [lado2]
        mov rdx, [lado3]
        add rdx, rbx
        mov rbx, [lado1]
        cmp rbx, rdx
        jl .analise_lado2
        jmp print_nao_triangulo

    .analise_lado2:
        mov rbx, [lado1]
        mov rdx, [lado3]
        add rdx, rbx
        mov rbx, [lado2]
        cmp rbx, rdx
        jl .analise_lado3
        jmp print_nao_triangulo

    .analise_lado3:
        mov rbx, [lado1]
        mov rdx, [lado2]
        add rdx, rbx
        mov rbx, [lado3]
        cmp rbx, rdx
        jl tipo_de_triangulo
        jmp print_nao_triangulo

tipo_de_triangulo:
    .lado1_igual_lado2:
        mov rbx, [lado1]
        mov rdx, [lado2]
        cmp rbx, rdx
        je .lado1_diferente_lado3
        jne .lado1_igual_lado3

    .lado1_diferente_lado3:
        mov rbx, [lado1]
        mov rdx, [lado3]
        cmp rbx, rdx
        jne print_isoceles
        jmp print_equilatero

    .lado1_igual_lado3:
        mov rbx, [lado1]
        mov rdx, [lado3]
        cmp rbx, rdx
        je print_isoceles
        jne .lado2_igual_lado3

    .lado2_igual_lado3:
        mov rbx, [lado2]
        mov rdx, [lado3]
        cmp rbx, rdx
        je print_isoceles
        jne print_escaleno

print_nao_triangulo:    ;se não for triangulo, printa a mensagem de naotriangulo
    mov rsi, naotriangulo
    mov rdx, tamanhoStr_naotriangulo
    call print_string
    ret

print_isoceles:
    mov rsi, isoceles
    mov rdx, tamanhoStr_isoceles
    call print_string
    ret

print_escaleno:
    mov rsi, escaleno
    mov rdx, tamanhoStr_escaleno
    call print_string
    ret

print_equilatero:
    mov rsi, equilatero
    mov rdx, tamanhoStr_equilatero
    call print_string
    ret

print_string:
    mov rax, 1
    mov rdi, 1
    syscall
    ret

ler_string:
    mov rax, 0
    mov rdi, 0
    mov rdx, 2
    syscall
    ret

string_to_int:
    xor rax, rax   ; Zerar rax para acumular o valor inteiro

    .str_to_int_loop:
        movzx rsi, byte [rdi]  ; Carregar um byte da string
        test rsi, rsi          ; Checa se \0
        je .str_to_int_done


        cmp rsi, 48             ; Digito invalido abaixo de 0
        jl .str_to_int_done
        
        cmp rsi, 57             ; Digito invalido acima de 9
        jg .str_to_int_done
        
        sub rsi, 48             ; Converte ASCII para decimal 
        imul rax, 10            ; Multiplica total by 10
        add rax, rsi            ; Add current digit to total
        
        inc rdi                 ; Get the address of the next character
        jmp .str_to_int_loop
    .str_to_int_done:
        ret

exit:
    ; Terminar a execução do programa
    mov rax, 60
    mov rdi, 0
    syscall