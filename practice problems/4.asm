
org 100h
.model small
.stack 100h 
.data
  
b db 0 
msg1 db "Enter a character: $"

msg2 db "It is a consonant $"
msg3 db "It is a vowel $"


.code
main proc
    
      
    mov ax,@data
    mov ds,ax
     
    lea dx,msg1
    mov ah,9
    int 21h  
    
    
    mov ah,1
    int 21h
    mov bl,al
    
     
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
   
   cmp bl,'a'
   je vowel 
   cmp bl,'e'
   je vowel
   cmp bl,'i'
   je vowel
   cmp bl,'o'
   je vowel
   cmp bl,'u'
   je vowel
   
    
    
    lea dx,msg2
    mov ah,9
    int 21h
    
    
     
     
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    jmp exit
    
    vowel:
    
    lea dx,msg3
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




