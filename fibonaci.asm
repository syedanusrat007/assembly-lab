
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack 100h

.data 
n db ?
i db 0
a db 0
b db 1
c db 0


msg1 db "please enter the input : $"  

.code 

main proc
    
     mov ax,@data
     mov ds,ax
     
     mov ah,9
     lea dx,msg1
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
     
      mov a,0
     mov b,1
     mov c,0
     
     loop1:
     
     mov bl,'1'
    
     cmp bl,cl
    
    
     
     mov dl,a
     add dl,48
     mov ah,2
     
     int 21h
            
     mov al,a
     add al,b
     mov c,al
     
     mov al,b
     mov a,al
     
     mov al,c
     mov b,al
     
     inc bl
     loop loop1
     
     mov ah,4ch
     int 21h
     
     main endp
end main

     
     
     
     
  main endp
end main

ret




