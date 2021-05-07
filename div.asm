
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h

.data
a db 0
b db 0
.code

main proc
   
    mov bl,6
    mov al,17
    div bl
    mov a,al
    
    
    
    mov ah,2
    mov dl,al
    add dl,48
    int 21h
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
          
    
    mov al,a
    mul bl
    mov b,17
    sub b,al  
      
      
     
    
    mov ah,2
    mov dl,b
    add dl,48
    int 21h

ret




