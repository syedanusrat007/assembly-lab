
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.model small
.stack 100h
.data 
a dw 0
.code
main proc
  
    xor cx,cx
    
    mov ah,1
    int 21h
    
    while:
    cmp al,13
    je end
   
    push ax
    inc cx
    int 21h
    jmp while
    
    end:
    mov ah,2
mov dl,13
int 21h
mov dl,10
int 21h

top: 
 
pop dx
int 21h
loop top
 

exit:

main endp
end main 


ret




