
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.model small
.stack 100h
.data 
a dw 0
b db 0 
c db 0
d db 0
m1 db "correctly bracketed $" 
m2 db "not correct $"

.code
main proc 
    mov ax,@data
    mov ds,ax
    

  
    xor cx,cx
    
    mov ah,1
    int 21h
    
    while:
    cmp al,13
    je p
   
    push ax
    inc cx 
    cmp al,'('
je c1 
cmp al,'{'
je c2 
cmp al,'['
je c3 
    cmp al,')'
je co1 
cmp al,'}'
je co2 
cmp al,']'
je co3 
    int 21h
    jmp while
    
  
c1:
mov b,'0' 
int 21h
    jmp while

c2:
mov c,'0' 
int 21h
    jmp while


c3:
mov d,'0' 
int 21h
    jmp while



 

co1:
add b,1 
int 21h
    jmp while

co2:
add c,1 
int 21h
    jmp while


co3:
add d,1 
int 21h
    jmp while


p:
mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    lea dx,m1
    mov ah,9
    int 21h
    
    jmp exit1

exit:
cmp b,'1'
je p3
mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    lea dx,m2
    mov ah,9
    int 21h
    jmp exit1
p3:
cmp c,'1'
je p2
mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    lea dx,m2
    mov ah,9
    int 21h
    jmp  exit1
p2: 
cmp d,'1'
je p

 mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    lea dx,m2
    mov ah,9
    int 21h
     exit1:


main endp
end main 


ret




