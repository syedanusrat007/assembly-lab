.model small
.stack 100h 
.data

a db 0 
msg db 'Enter a lowercase letter$'  
msg1 db 'In uppercase it is $'

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
    sub a,32
    
    
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
    
    
    
