.model small

.stack 100h

.data

a db ?
b db ?

msg1 db "above$"
msg2 db "below$"  
msg6 db "below equal$"
msg3 db "equal$"
msg4 db "enter two input$"
msg5 db "output$"


.code 
main proc 
    mov ax,@data
    mov ds,ax 
    
    lea dx,msg4
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,13h
    int 21h
    mov dl,10h
    int 21h
    
    mov ah,1
    add a,48
    int 21h
    
    mov ah,2
    mov dl,13h
    int 21h
    mov dl,10h
    int 21h 
    
    mov ah,1
    add b,48
    mov b,al
    mov al,b
    int 21h
    
    cmp a,al
    jb below
    je equal
    ja above
    jbe below_equ
    
    below:
    lea dx,msg2
    mov ah,9
    int 21h
    jmp exit
    
    equal:
    lea dx,msg3
    mov ah,9
    int 21h
    jmp exit 
    
   above:
    lea dx,msg1
    mov ah,9
    int 21h
    jmp exit 
    
    below_equ:
    lea dx,msg6
    mov ah,9
    int 21h
    jmp exit
    
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main
    
    
    
    
    
    
    
