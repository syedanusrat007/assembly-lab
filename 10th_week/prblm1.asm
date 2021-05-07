
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.model small
.stack 100h
.data
m1 db "Enter a number : $" 
m2 db "Do u want to continue : $"
m3 db "it is a perfect number  $"
m4 db "it is not a perfect number  $"

a db 0
b db 0
c db 0
s db 0 
e db 0

.code

main proc
    
     mov ax,@data
    mov ds,ax
    
     
    go: 
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    lea dx,m1
    mov ah,9
    int 21h
     
    
    
    call input
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    mov al,bl 
    mov e,bl
    
    call perfect
   
    
    
     main  endp 
print: 

lea dx,m3
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    lea dx,m2
    mov ah,9
    int 21h
  
    
    mov ah,1
    int 21h
             
    
    cmp al,'y'
    je go
    
    cmp al,'Y'
    je go
    
    jmp  exit1

    
 input proc
          
    xor bx,bx
    mov ah,1
    int 21h
    
    while:
    mov ah,0
    sub ax,48
    push ax
    mov ax,10
    mul bx
    pop bx
    add bx,ax
    
    mov ah,1
    int 21h
    cmp al,0dh
    jne while
    ret
    input endp
 
 perfect proc
     mov c,1
     
     whi:
     mov al,bl
     cmp c,al
     je exit
     
     mov ah,0
     mov al,bl
     div c
     
     
     cmp ah,0
     je sum
      inc c
      jmp whi

   sum:
  
   
   mov a,al
   cmp a,bl
   je lo
   
     add bh,a
     
     inc c
     jmp whi
     
     lo:
     inc c
     jmp whi
     
      ret
    perfect endp
 
 
 
 
 
 exit:
   mov al,e
   add bh,1 
   cmp bh,al
    je print
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    lea dx,m4
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    lea dx,m2
    mov ah,9
    int 21h
  
    
    mov ah,1
    int 21h
             
    
    cmp al,'y'
    je go
    
    cmp al,'Y'
    je go
    
    exit1:
    
     end main
    


ret




