
org 100h

.model small
.data

msg1 db "please enter the binary number : $"
msg2 db "using function  hexadecimal : $"
tmp db 10h
a db 0 
.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    
    mov ah,2
    mov dl,10
    int 21h  
    mov dl,13
    int 21h
    
    mov tmp,10h
    mov ah,1
    int 21h
    
  while:
    cmp al,13
    je exit
    cmp tmp,0
    jle exit
    shl bx,1
    and al,0fh
    or bl,al
    
    
    mov a,bl
    add bl,a
    add bl,a
    add bl,a
    add bl,a
    add bl,a
    add bl,a
    add bl,a
    add bl,a
    add bl,a
    
    dec tmp
    int 21h
    jmp while 
    
    
    
  exit:
  
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
  
    
    mov tmp,4
    mov cl,4 
    
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    
    mov ah,2
    mov dl,10
    int 21h  
    mov dl,13
    int 21h
    
 
while1:
    cmp tmp,0
    jle exit2
    dec tmp
    mov dl,bh
    shl bx,cl
    shr dl,cl
    add dl,48
    cmp dl,57
    jg letter
    mov ah,2
    int 21h
    jmp while1
    
  letter:
    add dl,7
    mov ah,2
    int 21h
    jmp while1  
    
  exit2:    
        
    

main endp
end main

ret




