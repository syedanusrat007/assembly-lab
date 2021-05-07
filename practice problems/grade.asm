.model small
.stack 100h
.data

ex dw 100
a dw 90
b dw 80
c dw 70
d dw 60
e dw 50
f dw 40

err dw "Error $"  
fa dw "Failed $"

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
    mov ah, 2 
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh
    int 21h
    
    cmp bx, ex
    jg error
    
    cmp bx, a
    jge AGrade
    
    cmp bx, b
    jge BGrade
    
    cmp bx, c
    jge CGrade
    
    cmp bx, d
    jge DGrade
    
    cmp bx, e
    jge EGrade
    
    cmp bx, f
    jge FGrade
    jl Fail
    
    AGrade:
    mov dx, 'A'
    int 21h
    
    jmp exit
    
    BGrade:
    mov dx, 'B'
    
    int 21h
    jmp exit
    
    CGrade:
  
    mov dx, 'C'
    int 21h
    
    jmp exit
    
    DGrade:
    mov dx, 'D'
    
    int 21h
    jmp exit
    
    EGrade:
    mov dx, 'E'
    int 21h
    
    jmp exit
    
    FGrade:
    mov dx, 'F'
    
    int 21h
    jmp exit 
    
    
    error:
    
    lea dx, err
    mov ah, 9
    int 21h
    jmp exit
    
   Fail: 
   
   lea dx, fa
   mov ah, 9
   int 21h
   
    
    exit:
    mov ah, 4ch
    
     int 21h
     
     main endp

end main