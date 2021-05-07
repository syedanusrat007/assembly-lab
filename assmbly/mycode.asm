.model small

.stack 100h

.data   

msg1 db "Enter 2 input$"
msg2 db "The sum is$"

.code

main proc  
         
         
         mov ax,@data
         mov ds,ax
         
         lea dx,msg1
         mov ah,9h
         int 21h
         
    
    
    mov ah,1h
    int 21h
    mov bl,al
    
    
    mov ah,1h
    int 21h
    add bl,al
    sub bl,48
    

     lea dx,msg2
     mov ah,9h
     int 21h
     mov dl,0dh
     int 21h
     mov dl,0ah
     int 21h
     mov dl,bl
    
    
    mov ah,2h
    int 21h
        