.model small

.stack 100h

.data

msg1 db "yes$"
msg2 db "no$"  


.code 
main proc 
    mov ax,@data
    mov ds,ax 
  
    
    mov ah,1
    int 21h
    
    cmp al,'A'
    je yes
    cmp al,'a'
    je yes
    jmp no
    
    yes:
    mov ah,2
    mov dl,10
    int 21h
    
    mov dl,13
    int 21h
    
    lea dx,msg1
    mov ah,9
    int 21h
    jmp exit
 
    
    no:
    mov ah,2
    mov dl,10
    int 21h
    
    mov dl,13
    int 21h
    
    lea dx,msg2
    mov ah,9
    int 21h
    jmp exit
    
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main
    
    
    
    
    
    
    






