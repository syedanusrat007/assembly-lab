.model small

.stack 100h

.data

.code

main proc
    t:
    mov dl,5
    add dl,48 
    mov ah,2
    int 21h
    
    jmp j
    
    j:
    mov dl,4
    add dl,48
    mov ah,2
    int 21h
    
    jmp h
    
    h:
    mov dl,4 
    add dl,48
    dec dl
    mov ah,2
    int 21h
    
   
    
    mov ah,4ch
    int 21h
    
    main endp
end main
    