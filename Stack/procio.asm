
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
a db 0
m1 db "1.push : $"
m2 db "2.pop : $"
m3 db "Enter choice : $"
.code
main proc
    
     mov ax,@data
    mov ds,ax
     
    call print 
   
    mov ah,1
    int 21h
    mov a,al
    sub a,48
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h        
  
    
    cmp a,1
    je pus
    cmp a,2
    je po
    
    
    pus:
    
    xor cx,cx
    
    mov ah,1
    int 21h
    
    while:
    cmp al,13
    je end
   
    push ax
    inc cx
    int 21h
    jmp while 
    
   
    
end:
mov ah,2
mov dl,13
int 21h
mov dl,10
int 21h

 call print 
 
  mov ah,1
    int 21h
    mov a,al
    sub a,48
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    cmp a,1
    je pus
    cmp a,2
    je po
    
    exit: 
    
   po:   

  top: 
 
 pop dx
 int 21h
 loop top
   
    
    main endp 

print proc 
    
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
    
    lea dx,m1
    mov ah,9
    int 21h  
     
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    lea dx,m2
    mov ah,9
    int 21h  
     
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    lea dx,m3
    mov ah,9
    int 21h  
     
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    

    
    print endp
  ret
end main






