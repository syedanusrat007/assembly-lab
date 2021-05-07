org 100h
.stack 100h
.model small
.data
m1 db "Input : $"
m2 db "output : $" 
a db 0 
.code

main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,m1
    mov ah,9
    int 21h
    
    xor bx,bx
    xor cx,cx
    
    mov ah,1
    int 21h
    
    while:
    cmp al,13
    je print    ;INPUT
    
    and al,15
    shl bx,1
    or bl,al
    
  
    mov ah,1
    int 21h
   
    jmp while
    
    print:
  
     mov ah,2
       mov dl,10
       int 21h
       mov dl,13
       int 21h
    
    lea dx,m2
    mov ah,9
    int 21h
    
     mov ah,2
       mov dl,10
       int 21h
       mov dl,13
       int 21h
        
      
       mov a,0
       
       display:
       cmp a,16
       je exit
       
       
       
       ror bx,1 ;reverse
       jc one
       
      
       
       mov ah,2
       mov dl,'0'
       int 21h
       shl cx,1
       or cl,0
       inc a
       jmp display
       
       one:
     
       mov ah,2
       mov dl,'1'
       int 21h
       shl cx,1
       or cl,1
       inc a
       
       jmp display
       
       exit:
       
       
       add bx,cx
          
      
        mov ah,2
       mov dl,10
       int 21h
       mov dl,13
       int 21h
       
        mov a,0 
        
       display2:
       cmp a,16
       je exit2
       
       
       
       rol bx,1
       jc one2
      
       
       mov ah,2
       mov dl,'0'
       int 21h
       inc a
       jmp display2
       
       one2:
     
       mov ah,2
       mov dl,'1'
       int 21h
       inc a
       
       jmp display2
       
       exit2:
       
       main endp
end main
       
ret




