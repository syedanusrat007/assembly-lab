
org 100h
.model small
.stack 100h 
.data
  
v db 0 
c db 0          
 d db 0
msg1 db "Number of vowels: $"

msg2 db "Number of Consonants: $"
msg3 db "Number of digits: $"


.code
main proc
    
      
    mov ax,@data
    mov ds,ax
  
    
    
   
    mov v,0
    mov c,0
    mov d,0
  while: 
   mov ah,1
    int 21h
    mov bl,al 
    
      cmp bl,13
      je print
    
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
   
   cmp bl,'1'
   je digit 
   cmp bl,'2'
   je digit
   cmp bl,'3'
   je digit
   cmp bl,'4'
   je digit
   cmp bl,'5'
   je digit
   cmp bl,'6'
   je digit 
   cmp bl,'7'
   je digit
   cmp bl,'8'
   je digit
   cmp bl,'9'
   je digit
   inc c
   
   
    
   jmp while
   
   
   
   vowel:
   inc v
   jmp while
   
   digit:
   inc d
   jmp while
   
  print: 
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,v 
    add dl,48
    int 21h
     
     
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    
    
    lea dx,msg2
    mov ah,9
    int 21h  
     
     mov ah,2
    mov dl,c
    add dl,48
    int 21h
   
   
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
    
    lea dx,msg3
    mov ah,9
    int 21h  
     
     mov ah,2
    mov dl,d
    add dl,48
    int 21h
   
   
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
           
   
    
    
    main endp

end main

ret




