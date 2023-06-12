;ALUNO: REYNAN DA SILVA DIAS PAIVA
;N° MATRICULA: 221115751

section .text
    global main

;chamando funcao do .C
extern media_aritmetica
extern media_geometrica
extern media_harmonica
extern exit

    ;funcao media_aritmetica
    movss xmm0, dword [rsp+8]   
    movss xmm1, dword [rsp+12]  
    movss xmm2, dword [rsp+16]  
    call media_aritmetica 
    ; 

    ;função media_geometrica
    movss xmm0, dword [rsp+8]   
    movss xmm1, dword [rsp+12]  
    movss xmm2, dword [rsp+16]  
    call media_geometrica 
    ; 

    ;função media_harmonica
    movss xmm0, dword [rsp+8]   
    movss xmm1, dword [rsp+12]  
    movss xmm2, dword [rsp+16]  
    call media_harmonica
      
    mov eax, 0  
    call exit
    
    
    ; ----------------------------- EXPLICANDO O CÓDIGO ---------------------------------------
    
    ;extern: no codigo, foi utilizado com objetivo de chamar as funcoes do .C, sendo elas ->  media_aritmetica; media_geometrica; media_harmonica

    ;rsp: é o STACK POINTER -> armazena dados temporários durante a execuão do programa.

    ;movsss: mov um valor de um local de memória ou registrador para um registrador do tipo xmm de 32 bits, especifico para trabalhar com pontos flutuantes

    ;dword: garante que os valores estão sendo interpretados corretamente como ponto flutuante de 32 bits, garante que a operação seja executada corretamente.
    
    ;ret: encerra programa
