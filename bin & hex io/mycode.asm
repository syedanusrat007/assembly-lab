
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack 100h
.model small
.data 
m1 db "input : $ "
m2 db "output : $ "
.code
main proc
     
     mov ax,@data
     mov ds,ax
     
     lea dx,m1
     mov ah,9
     int 21h
     
     mov ah,1
     int 21h
     
     while:
     cmp al,13
     je print
     
     cmp al,10
     jg l
     
     sub al,48
     jmp shft
     
     l:
     sub al,55
     
     
     shft:
     shl bx,4
     or bl,al
     
     mov ah,1
     int 21h
     
     jmp while
     
     
     print:
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h 
     
     lea dx,m2
     mov ah,9
     int 21h
     
     mov cl,4
     
     display:
      cmp cl,0
      jle exit
      dec cl
      
      mov dl,bh
      shl bx,4
      shr dl,4
      
      add dl,48
      
      cmp dl,57
      jg le
      
      mov ah,2
      int 21h
      jmp  display
      
      le:  
      add dl,7
      mov ah,2
      int 21h
      jmp  display       
      
      exit:

ret




