
org 100h
        
.model small

.stack 100h

.data

a db 0
b db 0 
msg1 db "Take 2 input : $"
msg2 db "The sum is : $"

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
    mov a,al
    
    mov ah,1
    int 21h 
    mov b,al
    
    mov al,a
    add b,al
    sub b,48
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
    
    lea dx,msg2
    mov ah,9
    int 21h  
    
    
    
    mov ah,2
    mov dl,b
    int 21h 
    
    mov ah,4ch
    int 21h
    
main endp
end main

ret




