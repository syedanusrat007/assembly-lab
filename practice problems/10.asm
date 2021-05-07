
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack 100h
.model small
.data 
m1 db "input : $ "
m2 db "Sum is : $ " 
c dw 0
n db 0
a dw 0
b dw 0
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
     
  mov cl,1
  mov a,1
  mov b,1
  mov c,0
 
  
 
  while:
   mov bx,0 
    mov ax,0
   cmp cl,n
   jg exit
    
    mov bx,b
    mov ax,a 
    mul bx
    add c,ax
     
 
    inc cl
    inc a
    add b,2
    
    jmp while
    
   
    exit:



   mov ax,c
   
   outdec proc 
          
    xor cx,cx
    
    mov bx,10
    
    repeat:
    CWD
    div bx
    push dx
    inc cx
    cmp ax,0
    jne repeat
    
    print:
    
    pop dx
    add dl,48
    mov ah,2
    int 21h
    loop print 
    ret
    outdec endp
     
     


end main

  




