

org 100h  
.model small
.stack 100h

.data


.code

main proc
    XOR cx,cx
    mov ah,1
    int 21h
    
   
    sub al,48
    mov cl,al
    
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    call fact
    
    mov dx,ax
    add dx,48
    mov ah,2
    int 21h
    mov ah,4ch
    int 21h
    main endp
    
    fact proc
    mov ax,1
    top:
    mul cx
    loop top
    ret
    fact endp  
end main




