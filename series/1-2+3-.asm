
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
  mov s,0
  while:
   cmp cl,n
   jg exit
   
   add bh,ch
   
   
      
   mov ah,2
   mov dl,bh
   add dl,48
   int 21h
   inc cl
   
  
   test bh,01h
   jz even 

   
   cmp cl,n
   je exit
    mov ah,2
   mov dl,'-' 
   int 21h
   
   add bl,bh 
   
   inc bh
   
   
   jmp while
   
   even:
   
  
   cmp cl,n
   je exit
    mov ah,2
   mov dl,'+'
   int 21h 
   
    sub bl,bh 
    
    inc bh
   
   jmp while
   
   
   exit:
    mov ah,2
   mov dl,'='
 
   int 21h
   
   
   
   mov ah,2
   mov dl,bl
  add dl,48
   int 21h
      
     sub dl,48
     mov bl,dl
    mov cl,0
       
       display:
       cmp cl,8
       je exit1
       
       rol bl,1
       jc one
       
       mov ah,2
       mov dl,'0'
       int 21h
       inc cl
       jmp display
       
       one:
       
        mov ah,2
       mov dl,'1'
       int 21h
       inc cl
       jmp display
       
       exit1:
          
     
     
     main endp

end main


ret




