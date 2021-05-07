
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


;a/2+b*3-c+d =5,1,5,7
org 100h

.stack 100h
.model small
.data 
a db 0
b db 0
c db 0
d db 0
e db 0 
f db 0
g db 0
i db 0
msg1 db "input : $"
msg2 db "output : $"
msg3 db "div : $"
msg4 db "ren : $" 
msg5 db "mul : $"
msg6 db "div+mul : $" 
msg7 db "div+mul-sub : $"
msg8 db "ans : $"

.code
main proc
    
     mov ax,@data
     mov ds,ax
     
     lea dx,msg1
     mov ah,9
     int 21h
     
     mov ah,1 
     int 21h
     sub al,48
     
     mov a,al
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h 
     
     mov ah,1 
     int 21h
     sub al,48
     
     mov b,al
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h 
     
     mov ah,1 
     int 21h
     sub al,48
     
     mov c,al
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h 
     
     mov ah,1 
     int 21h
     sub al,48
     
     mov d,al
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h 
     
     lea dx,msg2
     mov ah,9
     int 21h
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h 
     
             
     mov bl,2
     sub bl,48       
     mov al,a
     div bl
     mov f,al       
     mov e,al
     
     lea dx,msg3
     mov ah,9
     int 21h
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
       
      mov ah,2
      mov dl,f
      add dl,48
      int 21h
      
      
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
              
     mov bl,2
     sub bl,48  
      
      mov al,e
      mul bl
      sub a,al
      
      lea dx,msg4
     mov ah,9
     int 21h
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h 
      
      mov ah,2
      mov dl,a
      sub dl,48
      int 21h
      
       mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h 
      
      
     mov bl,3
     ;sub bl,48       
     mov al,b
     mul bl
     mov g,al 
     
     lea dx,msg5
     mov ah,9
     int 21h
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h       
     
      mov ah,2
      mov dl,g
      add dl,48
      int 21h
      
       mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
      
      mov cl,f
      add cl,g
      mov i,cl
      
      lea dx,msg6
     mov ah,9
     int 21h
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h 
      
      mov ah,2
      mov dl,i
      add dl,48
      int 21h
      
      mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     lea dx,msg7
     mov ah,9
     int 21h
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h 
     
     sub cl,c
     
     mov ah,2
      mov dl,cl
      add dl,48
      int 21h
      
      mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     add cl,d 
     
     lea dx,msg8
     mov ah,9
     int 21h
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h 
     
     mov ah,2
      mov dl,cl
      add dl,48
      int 21h
      
      mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
      
      
    main endp
end main
    

ret




