
org 100h
.model small
.stack 100h 
.data
  
a db 0 
msg1 db "enter the value of X : $"

msg2 db "Given input is an even number $"
msg3 db "Given input is an odd number $"


.code
main proc
    
      
    mov ax,@data
    mov ds,ax
     
    lea dx,msg1
    mov ah,9
    int 21h  
    
    
    mov ah,1
    int 21h
    sub al,48
    mov a,al
    
     
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
   
   cmp a,2
   je even 
   cmp a,4
   je even
   cmp a,6
   je even
   cmp a,8
   je even
   
   
    
    
    lea dx,msg3
    mov ah,9
    int 21h
    
    
     
     
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    jmp exit
    
    even:
    
    lea dx,msg2
    mov ah,9
    int 21h  
     
   
   
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
           
    
  exit: 
    
    
    
    main endp

end main

ret




