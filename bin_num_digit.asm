
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data
m1 db "input $"
c db 0
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
      je display
      sub al,48
      shr al,1
      jnc even
      
      int 21h
      jmp while
      
      even:
      inc c
      int 21h
      jmp while
      
      display:
        
       mov ah,2
       mov dl,10
       int 21h
       mov dl,13
       int 21h
       
   
       
       mov dl,c
       add dl,48
       mov ah,2
       int 21h
       mov ah,4ch
       int 21h
      
      
    
    
    main endp
end main

ret









