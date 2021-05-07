
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
     
      mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
     
     mov bl,1
     
     outt:
     cmp bl,n
     jg exit
     
     mov bh,n
     
     in1t:
     cmp bh,1
     jl inb 
     
     cmp bh,bl
     jle star
     
     mov ah,2
     mov dl,bh
     add dl,48
     int 21h
     
      mov ah,2
     mov dl,' '
     int 21h
     
     
     
     dec bh
     
     jmp in1t
     
     star:
     
     mov ch,1
     
     in2t:
     cmp ch,bh
     jg inb 
     
     
     
     mov ah,2
     mov dl,ch
     add dl,48
     int 21h
     
     mov ah,2
     mov dl,' '
     int 21h
     
      inc ch
     
     jmp in2t
     
     inb:
     
     mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
     
     inc  bl
      
     jmp outt
     
     exit:
     
     
     
     
     
     
     main endp

end main


ret




