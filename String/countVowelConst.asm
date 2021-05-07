.model small 
.stack 100h
.data  
string db 80 dup(?)
vowels db 'aeiou'
consonants db 'bcdfghjklmnpqrstvwxyz'
out1 db 0dh,0ah,'vowel=$'
out2 db ', consonants=$'
vowelct dw 0
consct dw 0
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    lea di,string
    call read_str
    mov si,di
    cld
repeat:
    lodsb
    lea di,vowels
    mov cx,5
    repne scasb
    jne ck_const
    
    inc vowelct
    jmp until
ck_const:
    lea di,consonants
    mov cx,21
    repne scasb
    jne until
    
    inc consct
until: 
    dec bx
    jne repeat 
    
    mov ah,9
    lea dx,out1
    int 21h
    mov ax,vowelct
    call outdec
    
    mov ah,9
    lea dx,out2
    int 21h
    mov ax,consct
    call outdec
    
    mov ah,4ch
    int 21h
    
    main endp 

read_str proc near
    
    push ax
    push di
    cld
    xor bx,bx
    mov ah,1
    int 21h
while1:
    cmp al,0dh
    je end_while
    cmp al,8h ; backspace
    jne else1
    
    dec dl
    dec bx
    
    jmp read
else1:
    stosb
    inc bx
read:
    int 21h
    jmp while1
end_while:
    pop di
    pop ax
    ret
read_str endp

outdec proc
    push ax
    push bx
    push cx
    push dx
    
    or ax,ax
    jge end_if1
    push ax
    mov dl,'-'
    mov ah,2
    int 21h
    pop ax
    neg ax
end_if1:
    xor cx,cx
    mov bx,100
repeat1:
    xor dx,dx
    div bx
    push dx
    inc cx
    
    or ax,ax
    jne repeat1
    
    mov ah,2
print_loop:
    pop dx
    or dl,30h
    int 21h
    loop print_loop
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret
outdec endp       

end main
    
    
   