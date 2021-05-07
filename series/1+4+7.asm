
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack 100h
.model small
.data 
m1 db "input : $ "
m2 db "output : $ " 
c db 0
n db 0
s db 0
.code
main proc
     
     mov ax,@data
     mov ds,ax
     
     lea dx,m1
     mov ah,9
     int 21h 
     
     mov ah,1
     int 21h
     
    sub al,48
    mov n,al
    
     
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    lea dx,m2
     mov ah,9
     int 21h
     
  mov cl,0
  mov bl,0
  mov bh,1
  mov ch,0
  
  while:
   cmp cl,n
   jg exit
   
   add bh,ch
   add bl,bh
   
   mov ah,2
   mov dl,bh
   add dl,48
   int 21h
   inc cl
   mov ch,3
   
   cmp cl,n
   je exit
    mov ah,2
   mov dl,'+'
 
   int 21h 
   
   jmp while
   
   exit:
    mov ah,2
   mov dl,'='
 
   int 21h
   
   mov ah,2
   mov dl,bl
   add dl,48
   int 21h   
     
     
     main endp

end main


ret




