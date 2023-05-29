section .data


str0   db  "Digite um numero inteiro: ",10,0
str1   db  "Digite outro numero inteiro: ",10,0
str2   db  "A soma dos valores é %d",10,0

fmt  db  "%d"

n1   dd 0
n2   dd 0

section .bss

res resb 1

section .text
    global main
    extern printf, scanf
    
    main:
    push    rbp
    mov     rbp, rsp


    mov     rdi, str0
    mov     rax, 0
    call    printf

    mov     rdi, fmt
    mov     rsi, n1
    mov     rax, 0
    call    scanf
    
    mov     rdi, str1
    mov     rax, 0
    call    printf
    
    mov     rdi, fmt
    mov     rsi, n2
    mov     rax, 0
    call    scanf
    
    mov rax, [n1]
    add rax, [n2]
    mov [res], rax
    
    mov     rdi, str2
    mov     rsi, [res]
    mov     rax, 0
    call    printf


    leave
    mov rax, 0
    ret
    
    
    
    
    
    
    
    
    

    
    
 

