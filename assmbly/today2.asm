

org 100h

.stack 100h

.data

.code

main proc
    
       mov ax,-3 
      
       
       cmp ax,0
       jl nega
       je zero
       jg pos
      
       
       nega:
       mov bx,-1 
       jmp exit
        
        zero:
       mov bx,0 
       jmp exit
       
      pos:
       mov bx,1 
       jmp exit
     
    exit: 
    mov ah,4ch
    int 21h
    
        
    main endp
end main 

ret








