
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data

n db 0
m1 db "input $"
.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,m1
    mov ah,9
    int 21h
    xor bx,bx
    
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
    jmp while
    
   print:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov n,4
    mov cl,4
    
    display:
    cmp n,0
    je exit
    dec n
    
    mov dl,bh
    shl bx,cl
    shr dl,cl
    add dl,48
    cmp dl,57
    jg letter
    
    mov ah,2
    int 21h
    jmp display
    
    letter:
    add dl,7
    mov ah,2
    int 21h
    jmp display
    
     
    exit:
    mov ah,4ch
    int 21h 
    
    main endp
end main

ret




