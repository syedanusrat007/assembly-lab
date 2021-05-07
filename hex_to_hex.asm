
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.model small
.stack 100h
.data
cl db 4
n db 4
m1 db "input $"
.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,m1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    while:
    cmp al,13
    je print
    
    cmp al,10
    jg letter
    
    sub al,48
    
    jmp shift
    
    letter:
    sub al,55
    
    shift:
    shl bx,4
    or bl,al
    int 21h
    jmp while    
   
   print:
   
   mov ah,2
   mov dl,10
   int 21h
   mov dl,13
   int 21h
    
    mov n,4
    print1:
  cmp n,0
    jle exit
    dec n
    mov dl,bh
    shl bx,4
    shr dl,4
    add dl,48
    cmp dl,57
    jg l
    mov ah,2
    int 21h
    jmp print1
    
  l:
    add dl,7
    mov ah,2
    int 21h
    jmp print1  
    
    
    exit:
    mov ah,4ch
    int 21h 
    
    main endp
end main

ret




