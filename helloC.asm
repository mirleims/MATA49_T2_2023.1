section .data
message: db  "Hello, word",13,10,0        
          
section .text
    global main
    extern printf
    main:
    push    rbp
    mov     rbp, rsp
    	                         
    mov rdi, message          
    call printf
    
    leave                    
    ret                               

          
          
