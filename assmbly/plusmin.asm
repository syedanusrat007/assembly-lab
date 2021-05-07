org 100h
.model small
.stack 100h 
.data
  
a db 0
b db 0
c db 0 
d db 0 
msg1 db "enter the value of number1 : $"
msg2 db "enter the value of number2 : $"
msg3 db "enter the sign : $"
msg4 db "result is : $"


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
    mov bl,b
    
    
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
    
    mov ah,1
    int 21h
    mov c,cl
    mov cl,c
     
    cmp c,'+'
    je plus
     
    jmp nega
    
    plus:
      add a,bl
    
      
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    lea dx,msg4
    mov ah,9
   
    int 21h
     
     mov ah,2
     mov dl,a
     add dl,48
     int 21h
     
     jmp exit  
     
     nega:
      sub a,bl
    
      
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    lea dx,msg4
    mov ah,9
   
    int 21h
     
     mov ah,2
     mov dl,a
     add dl,48
     int 21h  
      jmp exit  
      
    exit:
    
    mov ah,4ch
    int 21h
    
    main endp

end main

ret




