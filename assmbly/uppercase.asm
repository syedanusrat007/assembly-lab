.model small
.stack 100h
.data
msg db 'Take 2 input:$'  
msg1 db 'The sum is:$'
a db 0
b db 0
.code
main proc
    mov ax,@data
    mov ds,ax
    lea dx,msg
    mov ah,9
    int 21h
    
    mov dl,10
    mov ah,02
    int 21h 
    mov dl,13
    mov ah,02
    int 21h
    
    mov ah,1
    int 21h
    mov a,al
    mov ah,1
    int 21h
    mov b,al
    
    mov bl,a
    add bl,b
    mov a,bl
    
    sub a,48
    
    mov dl,10
    mov ah,02
    int 21h 
    mov dl,13
    mov ah,02
    int 21h
    
    lea dx,msg1
    mov ah,9
    int 21h
    mov ah,2
    mov dl,a
    int 21h
    
    
    main endp
end main
    
    
    
    