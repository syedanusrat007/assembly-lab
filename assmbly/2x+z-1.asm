
org 100h
.model small
.stack 100h 
.data
  
a db 0
b db 0
c db 0  
msg1 db "enter the value of X : $"
msg2 db "enter the value of Z : $"
msg3 db " the  value of A is  : $"


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
    
    mov ah,1
    int 21h
    sub al,48
    mov a,al
    mov al,a
    add a,al
   
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
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
    sub al,48 
    mov b,al
  
    mov al,b
    add a,al
    sub a,1
    mov al,a
    mov c,al
    
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    lea dx,msg3
    mov ah,9
    int 21h  
     
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,2
    mov dl,c
    add dl,48
    int 21h 
    
    
    
    main endp

end main

ret




