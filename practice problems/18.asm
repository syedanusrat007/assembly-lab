

org 100h  
.model small
.stack 100h

.data
msg1 db "enter the number : $"
msg2 db "Factorial of  $"
msg3 db " is: $"

.code

main proc
         
    mov ax,@data
    mov ds,ax
     
    lea dx,msg1
    mov ah,9
    int 21h  
    
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
    
     lea dx,msg2
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,cl
    add dl,48
    int 21h
    
     lea dx,msg3
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    call fact
    
    call outdec
    
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

end main




