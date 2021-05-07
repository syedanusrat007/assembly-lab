
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack 100h
.model small
.data 
a dw 3600 
b dw 60
c db 0
d db 0 
e db 0
f dw 0 
h db 0
.code
main proc
    call input 
    
    
    mov f,bx
    mov ax,bx
    div a
    
    
    mov c,al
    
    
    mov ax,word ptr c  
   
    call output 
    
     mov ax,word ptr c
     mul a
     sub f,ax
     mov ax,f
    div b
    mov d,al
     mov ax,word ptr d
    call output
    ;mov ax,f
    mov ax,word ptr d 
    mul b
    sub f,ax
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
    cWd
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
    




