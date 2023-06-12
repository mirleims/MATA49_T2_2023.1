; Questão 3 - Versão 2 (números)

; Alunos:   Iure Vieira Guimarães
;           Ivon Luiz Correia Martinez Garcia
;           Thiago Luigi Marinho de Mello

segment .data
    defesp: dq 1                        ; Define 1 quadbyte para defesp
    cont: dq 0                          ; Inicializa o contador
    fmtEntrada: dq "%d", 0              ; Define o formato de entrada
    fmtSaida: dq "%d ", 0               ; Define o formato de saída
    msgEntrada: db 'Informe os numeros separados por espaco para inverter: ', 10

segment .bss
    array resq 1                    ; Define o array onde será alocado os valores

segment .text
    global main                     ; Define a função global "main"
    extern printf                   ; Importa a função printf do C
    extern scanf                    ; Importa a função scanf do C

main:
    push rbp                        ; Inicia a pilha para as chamadas das calls

    mov rdi, msgEntrada
    call printf
    
    mov rbp, 0

    mov rax, 0                      ; Zera o registrador rax
    mov rcx, 0                      ; Zera o registrador rcx para fazer as comparações 
    mov rbx, 0                      ; Zera o registrador rbx

    PreencheArray:
        cmp rcx, 4                  ; Compara se rcx é igual a n posições do array
        je ChamaImpressaoReversa    ; Se for igual vai para a impressão

        mov [cont], rcx             ; Preserva o conteudo de rcx em cont antes do call
        mov rax, 0                  ; Move o valor 0 para rax
        mov rdi, fmtEntrada         ; Informa o formato de entrada para o rdi
        mov rsi, defesp             ; Move o valor de defesp para o rsi
        call scanf                  ; Chama a função scaf do C
        mov rax, [defesp]           ; move o endereço de a para rax
        mov rcx, [cont]             ; Retoma rcx
        mov [array+rcx*8], rax      ; Move o valor de rax para o array
        add rbx, [defesp]	        ; Adiciona o que está no endereço de a para rbx
        inc rcx                     ; Incrementa o contador feito em rcx para comparar se já está no final
        jmp PreencheArray           ; Pula para o loop novamente

    ChamaImpressaoReversa:
        mov rcx, 4                  ; Coloca o "ponteiro" no fim do array
        jmp ImprimeReverso          ; Chamada para imprimir em ordem inversa
    
    ImprimeReverso:
        cmp rcx, 0                  ; Compara se o valor em rcx é 0
        je finaliza                 ; Se for igual a 0 em rcx finaliza o programa
        mov rax, [array+(rcx-1)*8]  ; Move para a posição anterior do array
        dec rcx	                    ; Decrementa rcx para comparar
        mov [cont], rcx
        mov rdi, fmtSaida           ; Indica o formato de saída
        mov rsi, rax
        call printf                 ; Chama a função printf do C para printar o elemento
        mov rcx, [cont]
        jmp ImprimeReverso

    finaliza:
        mov rax, 0
        pop rbp                     ; Finaliza a pilha já que não teremos mais nenhum call de função do C
    ret