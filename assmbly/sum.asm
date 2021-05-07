.model small
.stack 100h
.data
a db 3
.code
main proc
    mov ax,@data
    mov ds,ax
    mov al,'5'
    sub al,a
    mov a,al
   
    mov dl,a
    mov ah,2
    
    int 21h 
    mov ah,4ch
    int 21h
    main endp
end main