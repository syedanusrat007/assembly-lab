.model small
.stack 100h
.data  
        ; (-32767 to 32767) decimal range
a dw ?
b dw ?

.code
main proc  
    mov ax, @data
    mov ds, ax
    
    
    xor bx, bx
    xor cx, cx
    
    mov ah, 1
    int 21h   
    
    input:
    
    cmp al, 0Ah
    je next
    
    cmp al, 30h
    jl error
    
    cmp al, 39h
    jg error
    inc cx
    and ax, 000Fh
    push ax
    push ax
    
    mov ax, 10
    
    mul bx
    
    mov bx, ax
    pop ax
    
    add bx, ax
    mov ah, 1
    int 21h
    
    cmp al, 0Dh
    jne input
    
    
    mov a, bx 
    xor bx, bx
    
     reverse:
    
    mov ax, 10
    
    mul bx
    
    mov bx, ax
    pop ax
    
    add bx, ax
    
    loop reverse 
    
    mov b, bx
    
    
    
    
    next:
    mov ah, 2 
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h
    
    
    xor cx, cx
    ;cmp bx, 0
    ;jle exit
    
    
    
    mov ax, bx
    mov bx, 10
    
   output:
    
    xor dx, dx
    div bx
   push dx
    inc cx  
    or ax, ax
    jne output
    
    mov ah, 2
    
    print:
    
    pop dx
    or dl, 30h 
    
    int 21h
    loop print 
    
    
    
    
    
    mov  bx, b
    cmp bx, a
    jne n_
    
    mov dx, 'Y'
    mov ah, 2
    int 21h
    jmp exit
    
    n_:
      mov dx, 'N'
    mov ah, 2
    int 21h
    jmp exit
    
    error:
    
    mov dx, 'e'
    
    mov ah, 2
    int 21h
    
    exit:
    mov ah, 4ch
    
     int 21h
     
     main endp

end main