;Guilherme Caria, Camila Almeida. Aymar Schindler


section .data
    
    hifen db "-"
    tamHifen EQU $-hifen
    
section .bss
    temperatura resb 8 ;reserve 8 bytes para a temperatura (tamanho de um registrador)
    
    ; reserva 100 bytes para nossa memória usada para guardar um número decimal
    digitMemory resb 100
    
    ; reserva 8 bytes para a posição do dígito atual (tamanho de um registrador)
    digitPosition resb 8

 

section .text
    global _start
    
    

    
        
_start:

    ;Leitura da temperatura em Fahrenheit
    mov rax, 0
    mov rdi, 0
    mov rsi, temperatura
    mov rdx, 32
    syscall

    
_temperaturaToInteger:
    mov rbx, 10 ;para dividir por 10
    xor rax, rax ;limpa rax
    mov rcx, temperatura ;coloca o valor ascii em rcx
    
    _loop:
        movzx rdx, byte [rcx]; Pega o byte atual em rcx extendido com zeros
        test rdx, rdx ;rdx == 0?
        jz _fim
        
        inc rcx ;próximo digito
        
        cmp rdx, '-'
        jz _achouNegativo
        
        sub rdx, 48 ;obtem o valor decimal
        
       ;mul rbx; rax*10
        add rax, rax
        lea rax, [rax+rax*4]
        add rax, rdx ;rax= rax+rdx
        jmp _loop
        
    _achouNegativo:
        mov r8, 1 ;Flag para indicar que o input foi um numero negativo
        jmp _loop
_fim:
    

    ;Conversao da temperatura (valor já está em rax)

    ;Multiplicando por 5
    mov rbx, 5
    mul rbx; resultado fica guardado em rax

    ;Dividindo por 9
    mov rdx, 0
    mov rbx, 9
    div rbx; resultado fica guardado em rax
    
    
    ;Caso a conversão da temperatura seja um numero negativo
    cmp r8, 1
    jnz _subtract
    neg rax
    
    _subtract:
        ;Subtraindo 17
        ;(tomamos a liberdade de arredondar para baixo devido ao zero em celsius)
        sub rax, 17
        mov rbx, rax; guardando o resultado em rbx
        js _flip
   
  _result:
    
    mov rax, rbx
    call _printRaxInteger
  
 _end:   
    mov rax, 60
    mov rdi, 0
    syscall
    
_flip:
    neg rbx ;complemento de 2 do valor
    mov rax, 1
    mov rdi, 1
    mov rsi, hifen
    mov rdx, tamHifen
    syscall
    jmp _result
    
_printRaxInteger:
    
    mov rcx, digitMemory ;Guarda o endereço em rcx
    mov rbx, 10 ; new line char
    mov [rcx], rbx ;coloca o new line no endereço em rcx(digitMemory)
    inc rcx ;incrementa o rcx
    mov [digitPosition], rcx ;coloca a posição do proximo caractere em digitPosition
    
    _getDigitLoop:
        mov rdx, 0 ;valor colocado para não concatenar rax e rbx
        mov rbx, 10
        ;divide o valor de rax pelo valor de rbx(10) (guarda o resto em rdx)
        div rbx 
        push rax ;guarda o resultado da divisão na pilha
        ; adiciona 48 ao resto para converter no número decimal correspondente
        add rdx, 48 
        
        mov rcx, [digitPosition]; coloca a posição do proximo caractere em rcx
        ;coloca o caractere obtido em rdx no local guardado em rcx
        ;(digitPosition que guarda o local da memoria digitMemory)
        mov [rcx], dl  
        inc rcx ;incrementa rcx
        mov [digitPosition], rcx;coloca a posição do proximo caractere em digitPosition
        
        pop rax ;recupera o resto do numero de rax
        cmp rax, 0
        jne _getDigitLoop ; caso o resultado da divisao nao seja zero, refazer o loop
        
    ;Imprime o número na ordem correta, pois obtemos ele ao contrário
    _printLoop:
        mov rcx, [digitPosition]
        
        mov rax, 1
        mov rdi, 1
        mov rsi, rcx
        mov rdx, 1
        syscall
        
        mov rcx, [digitPosition]
        dec rcx
        mov [digitPosition], rcx
        
        cmp rcx, digitMemory
        jge _printLoop
        
        ret