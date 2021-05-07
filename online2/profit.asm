
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data 
a dw 0
b dw 0
c dw 0
.code
main proc
    call input
    
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
   
     
    mov a,bx
    
    call input
    
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    mov ax,a
    mul bx
    mov cx,ax
    
    mov c,100
    
    call input
    mov ax,cx
    mul bx
    div c
    mov bx,ax
     
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    
    mov ax,bx
    
    call output
    
    mov ah,4ch
    int 21h
    main endp
    
input proc
     xor bx,bx
     mov ah,1
     int 21h
     
     while:
     mov ah,0
     sub ax,48
     push ax
     mov ax,10
     mul bx
     pop bx
     add bx,ax
     
     mov ah,1
     int 21h
     cmp al,13
     jne while
     
     ret
     input endp

output proc
    xor cx,cx
    mov bx,10
    
    repeat:
    cwd
    div bx
    push dx
    inc cx
    cmp ax,0
    jne repeat
    
    print:
    pop dx
    add dl,48
    mov ah,2
    int 21h
    loop print
    
    ret
    
    output endp

end main
