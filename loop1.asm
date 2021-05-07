.model small
.stack 100h
.data
.code
main proc
    mov cx,9 
    mov ah,2
    mov dl,'1' 
    
    top:
    int 21h
    inc dl
    
    loop top
    
    mov ah,4ch
    int 21h
    
    main endp
end main
    