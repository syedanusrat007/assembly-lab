.model small
.stack 100h
.data 
a dw 0
msg1 db "Enter the number : " 
msg2 db "is a palindrome number "
msg3 db "is not a palindrome number "
 
.code
main proc 
    mov ax,@data
    mov ds,ax
          
   lea dx,msg1
   mov ah,9
   int 21h
   
    call input 
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    mov cx,bx
    mov ax,bx
    call outdec
    
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
    cmp al,0dh
    jne while
    ret
    input endp



outdec proc 
          
    xor cx,cx 
    mov bx,10
    
    repeat:
    CWD
    div bx
    mov ax,dx
    push dx
     
    
    inc cx
    cmp ax,0 
   
    
    pop dx
    add dl,48
    mov ah,2
    int 21h
     
    
    
    
    jne repeat
    
    
    
    
    outdec endp

 end main