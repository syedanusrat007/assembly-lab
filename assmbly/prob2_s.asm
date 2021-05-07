.model small

.stack 100h

.data



msg1 db "Enter alowecase$"

msg2 db "in uppercase$"

.code

main proc
    
    mov ax,@data
    mov ds,ax
    
   lea dx,msg1
   mov ah,9h
    int 21h  
    mov dl,10
    mov ah,02
    int 21h
    mov dl,13
    mov ah,02
    int 21h 
    
    
    mov ah,1h
    int 21h
    
    mov bl,al
    sub bl,20h 
    
    mov dl,10
    mov ah,02
    int 21h
    mov dl,13
    mov ah,02
    int 21h 
    
            
    lea dx,msg2
               
     mov ah,9h
     int 21h 
     mov dl,10
    mov ah,02
    int 21h
    mov dl,13
    mov ah,02
    int 21h 
     
     mov dl,bl 
     mov ah,2h
              
     
     
     
     int 21h   
     
     mov ah,4ch
     int 21h
     
endp

               
    
    
    