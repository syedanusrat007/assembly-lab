org 100h
.stack 100h
.model small
.data
m1 db "Input : $"
m2 db "output : $"
.code

main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,m1
    mov ah,9
    int 21h
    
   xor bx,bx
    mov ah,1
    int 21h
    
    while:
    cmp al,13
    je func
    
    and al,15
    shl bx,1
    or bl,al
    
    mov ah,1
    int 21h
    
    jmp while
    
    func:
    
    mov ax,bx
    mov dx,bx
    
    shr ax,2
    shl dx,1
    add ax,dx
    shl ax,4
    
    mov bx,ax
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    lea dx,m2
    mov ah,9
    int 21h
    
    mov cl,0 
    
    
    print:
    
    cmp cl,16
    je exit
    
    rol bx,1
    jc one
    
    mov ah,2
    mov dl,'0'
    int 21h
    
    inc cl
    jmp print 
    
    
    one:
    mov ah,2
    mov dl,'1'
    int 21h
    
    inc cl
    jmp print
    
    
    exit:
       
       main endp
end main
       
ret




