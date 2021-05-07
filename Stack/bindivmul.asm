
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data
a db 0
b db 0
c db 0
d db 0 
e db 0
f db 0
.code

main proc
    
    mov ah,1
    int 21h
    mov a,al
    sub a,48 
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    
    call input 
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    mov b,bl
    mov al,b
    
    mul a
    mov c,al
    
    call outdec
    ;mov f,al
    
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    mov ah,1
    int 21h
    mov d,al
    sub d,48 
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    mov al,c
    mov ah,0
    div d
    
    mov e,al 
    
     
     
    call outdec
    
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
    cmp al,0dh
    jne while
    ret
    input endp 

outdec proc 
          
    xor cx,cx 
    mov bx,10
    
    repeat:
    CWD
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
    outdec endp



ret




