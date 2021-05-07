
org 100h
.model small
.stack 100h
.data
m1 db "Enter the size of the array : $"
m2 db "Enter the element of array : $"
m3 db " occurred $" 
m4 db " times $"
 a db 0
 count db 0
array db a dup(?)
  
.code 
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,m1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    add al,48
    mov a,al
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
    
    
    print:
    
    xor bx,bx
    mov ah,1
    int 21h  
    lea si, a
    
    while:
    cmp al,13
    je end1
    mov ah,0
    sub ax,48
    push ax
    mov ax,10
    mul bx
    pop bx
    add bx,ax
    
    
    mov ah,1
    int 21h
    
    cmp al,32
    je end 
    jmp while
    
    end:
    mov [si],bx
    add si,2 
    xor bx,bx
    xor ax, ax
    mov ah, 1
    int 21h
    jmp while
     
     ;;;;;newline 
    end1: 
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    int 21h 
    mov count,4
    mov si,0
    
   
     
   
    


ret




