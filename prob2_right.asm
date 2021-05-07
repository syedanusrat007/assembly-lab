
.model small

.stack 100h

.data

 
msg db "Enter a Hexadecimal number$"
msg2 db "The binary number is $"

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
    
    cmp al,39h
    
    jg letter
    
    and al,0fh
    
    shl bx,4
    
    or bl,al
    
    int 21h
    
    jmp while
    
    letter:
    
    sub al,37h
    
    shl bx,4
    
    or bl,al
    
    int 21h
    
    jmp while
    
    
    print:
    
     mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
    
     
    lea dx,msg2
    mov ah,9
    int 21h
    
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
    
    mov cl,0
    
    display:
    
    cmp cl,16
    
    je exit
    
    rol bx,1
    
    jc one
    
    
    mov dl,'0'
    mov ah,2
    int 21h
    inc cl
    jmp display
    
    
    one:
    
    mov dl,'1'
    mov ah,2
    int 21h
    inc cl
    jmp display
    
    
    
    
    exit:
    
    mov ah,4ch
    int 21h
    
  


