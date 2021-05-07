

org 100h  
.model small
.stack 100h

.data
msg1 db "enter number_1 : $"
msg2 db "enter number_2 : $"
msg3 db " is divisible by  $"
msg4 db " is not divisible by  $"
b dw 0
a dw 0 
c dw 0
.code

main proc
         
    mov ax,@data
    mov ds,ax
     
    lea dx,msg1
    mov ah,9
    int 21h  
    
   
    
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    call input
    
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
     mov ax,bx
     mov cx,ax
     lea dx,msg2
    mov ah,9
    int 21h  
    
   
    
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,1
    int 21h
    mov bx,ax
    mov b,bx
    sub b,48
    
     
    mov ax,cx
    div bx
  
    
    cmp al,'0'
    je p
        
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    call outdec
     lea dx,msg4
    mov ah,9
    int 21h
    
    mov ah,2
    mov dx,b
    add dl,48
    int 21h 
 exit:    
     
    mov ah,4ch
   int 21h 
   
p: 
mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h


 call outdec
 
 
    
     lea dx,msg3
    mov ah,9
    int 21h
    
    mov ah,2
    mov dx,b
    add dx,48
    int 21h
    
    jmp exit
    
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
    mov ax,cx
    xor cx,cx
    mov bx,10
    
    repeat:
    cwd
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




