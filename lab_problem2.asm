org 100h
.model small
.stack 100h
.data

m1 db 'Please enter the binary number$'
m2 db 13,10,'The result in binary is$'
m3 db 13,10,'The result in Hexadecimal is$'

.code

main proc
    
mov ax,@data
mov ds,ax

lea dx,m1
mov ah,9
int 21h 

mov dl,10
mov ah,2
int 21h
mov dl,13
mov ah,2
int 21h

xor bx,bx
mov ah,1
int 21h

while1:

     cmp al,13
     je end_while1  
     sub al,48
     shl bx,1
     or bl,al
     int 21h
     jmp while1
     
end_while1:
     
    lea dx,m2
    mov ah,9
    int 21h
    
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
    
    mov cx,bx
    shr cx,2
    mov dx,bx
    shl dx,1
    add cx,dx
    shl cx,3
    mov bx,cx
     
    
    mov ch,0
    
    while2:
        cmp ch,16
        je end_while2
        
        rol bx,1
        jc one 
        
        mov dl,'0'
        mov ah,2
        int 21h
        
        inc ch
        jmp while2
        
        one:
            mov dl,'1'
            mov ah,2
            int 21h
            
            inc ch
            jmp while2 
end_while2:            
             
    lea dx,m3
    mov ah,9
    int 21h
    
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
    
    mov ch,0
    
    while3:
        cmp ch,4
        je exit 
        
        mov dl,bh
        shr dl,4
       
        cmp dl,9
        jg letter
        
        add dl,48
        mov ah,2
        int 21h
        inc ch
        rol bx,4 
        jmp while3
      
        letter:
        add dl,55
        mov ah,2
        int 21h
               
        inc ch 
        rol bx,4
        jmp while3
   
    
exit:
    mov ah,4ch
    int 21h

main endp
end main
