.model small
.stack 100h
.data   
    msg db "Decimal Inpur : $" 
    p db "Palindrome$"  
    notpp db "Not Palindrome$"
    n dw 0
    rev dw 0
    count db 0 
.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,msg
    mov ah,9
    int 21h
    
    call new
    
    xor cx,cx
    xor dh,dh  
    input:
       mov ah,1
       int 21h 
       cmp al,13
       je endinput
       sub al,48
       xor ah,ah
       push ax
       mov bl,al
       xor bh,bh
       mov ax,cx
       mov dl,10
       mul dl
       add ax,bx
       mov cx,ax
       inc dh
       jmp input
    endinput:   
    
    mov n,cx
    ;mov count,dh 
    call new
   
    xor ax,ax
    while:
        cmp dh,0
        je exit
        pop cx
        xor bl,bl
        mov dl,10
        mul dl
        add ax,cx
        dec dh
        jmp while 
        
        
    exit: 
    mov cx,n
    ;mov dx,n
    cmp cx,ax
    je palin
    jmp notp
    palin:
        lea dx,p
        mov ah,9
        int 21h
        call new
        jmp sesh
        
   notp: 
        lea dx,notpp
        mov ah,9
        int 21h
        call new
        jmp sesh    
        
    sesh:
    
    
    mov ah,4ch
    int 21h
    
main endp      

new proc
    
   mov ah,2
   mov dl,10
   int 21h
   mov dl,13
   int 21h
   
    ret
new endp 

end main