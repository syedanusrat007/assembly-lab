
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
 .model small
.stack 100h
.data
m1 db "input : $"
m2 db "output : $" 
n db 16
a db 0
.code

main proc
     
     mov ax,@data
     mov ds,ax
     
     lea dx,m1
     mov ah,9
     int 21h 
      
     xor bx,bx
      
     mov ah,1
     int 21h
     
    
     while:
       cmp al,13
       je divt
      
       and al,15
       shl bx,1
       or bl,al
       mov ah,1
       int 21h
       jmp while
       
   divt:
     mov cx,bx
     shl cx,2
     mov bx,cx
    
     
    
       
  print:
    
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
    
     
    lea dx,m2
    mov ah,9
    int 21h
    
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
     
    mov al,2
    mov cl,0
    
    display:
    
    cmp cl,n
    jge exit
    
    rol bx,1
    jc one
   
    
    
    mov dl,'0'
    mov ah,2
    int 21h
    inc cl
    jmp display
    
    
    one:
    
    mov dl,'1'
    mov ah,2
    int 21h
    inc cl
    jmp display
    
    
    
     
   exit:
   mov ah,4ch
   int 21h
    
   main endp
end main

ret




