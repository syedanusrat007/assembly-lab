
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
     
     mov bl,cl
     
     out_t:
     cmp bl,1
     jl exit
     
     mov dh,bl 
     in1_t:
     
     cmp dh,cl
     jg in1_b
     
     mov ah,2
     mov dl," "
     int 21h
     
     inc dh         
     jmp in1_t
      
     in1_b:
     
     mov bh,bl
     
     in2_t:
     cmp bh,1
     jl in2_b
     
     mov dl,bh
     add dl,48
     
     mov ah,2
     int 21h
     
     mov ah,2
     mov dl," "
     int 21h
     
     dec bh         
     jmp in2_t
     
     in2_b:
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h 
     
     dec bl
     jmp out_t
     
     exit:
 
 
 
 
 main endp
 end main

ret




