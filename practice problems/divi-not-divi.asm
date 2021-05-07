.model small
.stack 100h

.data 

num1 dw "Number_1: $"
num2 dw 0Ah, 0Dh, "Number_2: $"

divi dw 0Ah, 0Dh," Divisibe by $"
ndivi dw 0Ah, 0Dh," not divisible by $" 
err dw "Error$"
a dw ?
b dw ?


.code
main proc
    
    mov ax, @data
    mov ds, ax
    
   lea dx, num1
   mov ah, 9
   int 21h
   
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
    
    and ax, 000Fh
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
    
    next:
    mov a, bx
    
    lea dx, num2 
    mov ah, 9
    int 21h
    xor ax, ax
    xor bx, bx
    xor cx, cx
    
    mov ah, 1
    int 21h   
    
    input2:
    
    cmp al, 0Ah
    je next
    
    cmp al, 30h
    jl error
    
    cmp al, 39h
    jg error
    
    and ax, 000Fh
    push ax
    
    mov ax, 10
    
    mul bx
    
    mov bx, ax
    pop ax
    
    add bx, ax
    mov ah, 1
    int 21h
    
    cmp al, 0Dh
    jne input2
    
    mov b, bx
    
    mov ax, a
    div bx
    
    
    cmp dx, 0
    je divisible:
    
   
    
    lea dx, ndivi
    mov ah, 9
    int 21h
    
   
    
     jmp exit
    divisible:
    
    
    lea dx, divi
    mov ah, 9
    int 21h
    
    
    
     jmp exit
     error:
    
    lea dx, err
    mov ah, 9
    int 21h
    jmp exit
    
    
    
    
    exit:
    mov ah, 4ch
    int 21h
    
    main endp 
end main