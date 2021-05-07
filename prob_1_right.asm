
.model small

.stack 100h

.data 

msg db "Enter a binary number$"
msg2 db "Total number of 1 is $"

.code

main proc 
    
    mov ax,@data
    mov ds,ax
    
    xor bx,bx
    
    lea dx,msg
    mov ah,9
    int 21h
    
    mov dl,10
    mov ah,2
    int 21h 
    mov dl,13
    mov ah,2
    int 21h
    
    mov ah,1
    int 21h
    
    while:
    
    cmp al,0dh
    
    je print
    
    and al,0fh
    
    shl bx,1
    
    or bl,al
    
    int 21h
    
    jmp while
    
    
    print:
    
    mov ch,0
    mov cl,0
    
    display:
    
    cmp cl,16
    
    je exit
    
    shl bx,1
    
    jnc again
    
    inc ch
    inc cl
    
    jmp display
    
    
    again:
    inc cl
    
    jmp display
    
    
    
    
    exit:
    
     
    mov dl,10
    mov ah,2
    int 21h 
    mov dl,13
    mov ah,2
    int 21h
    
    
    lea dx,msg
    mov ah,9
    int 21h
   
    
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
    
    
    mov dl,ch
    add dl,48
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h

