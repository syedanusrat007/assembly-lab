
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
m1 db "input : $"
m2 db "output : $"
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
     mov cl,al
     
     mov ah,2
       mov dl,10
       int 21h 
       mov dl,13
       int 21h
       
     lea dx,m2
     mov ah,9
     int 21h
      
      mov ah,2
       mov dl,10
       int 21h 
       mov dl,13
       int 21h
     
     mov bl,1
     outer_t:
     cmp bl,cl
     jg exit
     
     mov dh,cl
     
     inner1_t:
     cmp dh,bl
     jl inner1_b
     
     mov ah,2
     mov dl," "
     int 21h
     
     dec dh
     
     jmp inner1_t
      
     inner1_b:
     
     
      mov bh,1
      
      inner2_t:
     
      cmp bh,bl
      jg inner2_b 
      
     
      mov dl,bh
      add dl,48
     
      mov ah,2
      int 21h
      
      mov ah,2
      mov dl," "
      int 21h
      
       inc bh
      jmp inner2_t
      
      inner2_b:
       mov ah,2
       mov dl,10
       int 21h 
       mov dl,13
       int 21h
       
       inc bl
       jmp outer_t
    exit:   
     
     
   
   main endp
end main
    

ret




