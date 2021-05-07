org 100h
.stack 100h
.model small
.data
m1 db "Input : $"
m2 db "output : $" 
b db 0 
a db 0 
.code

main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,m1
    mov ah,9
    int 21h
    
    xor bx,bx
    mov a,0
    
    mov ah,1
    int 21h
    
    while:
    cmp al,13
    je print
    
    and al,15
    shl bx,1
    or bl,al
    
    mov ah,1
    int 21h
    
    inc a
    
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
       
       mov cl,0
       mov b,0
       
       display:
       cmp cl,16
       je exit
       
       
       rol bx,1
       jc one
       
       mov ah,2
       mov dl,'0'
       int 21h
       inc cl
       jmp display
       
       one:
       inc b
       mov ah,2
       mov dl,'1'
       int 21h
       inc cl
       
       jmp display
       
       exit:
       
       mov ah,2
       mov dl,10
       int 21h
       mov dl,13
       int 21h
       
       mov ah,2
       mov dl,b
       add dl,48
       int 21h  
       
        mov ah,2
       mov dl,10
       int 21h
       mov dl,13
       int 21h
       
       mov ah,2
       mov dl,a
       add dl,48
       int 21h
       
       main endp
end main
       
ret




