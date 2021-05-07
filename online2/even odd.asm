
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.model small
.stack 100h
.data
count db 0
n db 0 
var db 0
a dw 10 dup(?)
b dw 10 dup(?)
c dw 10 dup(?)

.code
main proc 
    
    mov ah,1
    int 21h
    sub al,48
    mov count,al
    
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    xor bx,bx
    mov ah,1
    int 21h
    lea si,a 
    
    
    while:
    cmp al,13
    je end
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
    je end1
    
    jmp while
    
    end1:
    mov [si],bx
    add si,2
    xor bx,bx
    xor ax,ax
    mov ah,1
    int 21h
    jmp while
    
    end:
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
   
    mov si,0
    mov cl,1
    output:
    
    test a[si],01h
    jz even 
    
    mov bx,a[si]
    mov b[si],bx 
    mov ax,b[si] 
    mov var,0 
    
    output1: 
    cwd
    mov cx,10
    div cx
    push dx
    inc var
    cmp ax,0
    je print
    jmp output1
    
    print:
    pop dx
    dec var
    add dl,48
    
    mov ah,2
    int 21h
    
    cmp var,0
    je exit
    jmp print
    
    exit:
    dec count
    cmp count,0
    je exit1
    add si,2
    
    mov ah,2
    mov dl,' '
    int 21h
    
    jmp output
    
    exit1:
   jmp o 
    
    even: 
    
    mov bx,a[si]
    mov c[si],bx 
    mov ax,c[si] 
    mov var,0 
    
    output2: 
    cwd
    mov cx,10
    div cx
    push dx
    inc var
    cmp ax,0
    je print
    jmp output2
    
    print1:
    pop dx
    dec var
    add dl,48
    
    mov ah,2
    int 21h
    
    cmp var,0
    je exit3
    jmp print1
    
    exit3:
    dec count
    cmp count,0
    je exit2
    add si,2
    
    mov ah,2
    mov dl,' '
    int 21h
    
    jmp output
    
    exit2:
   o:
    mov si,0 
    output4:
     
    
    mov ax,b[si] 
    
    mov var,0 
    
    output5: 
    cwd
    mov cx,10
    div cx
    push dx
    inc var
    cmp ax,0
    je print6
    jmp output5
    
    print6:
    pop dx
    dec var
    add dl,48
    
    mov ah,2
    int 21h
    
    cmp var,0
    je exit7
    jmp print6
    
    exit7:
    dec count
    cmp count,0
    je exit8
    add si,2
    
    mov ah,2
    mov dl,' '
    int 21h
    
    jmp output4
    
    exit8:
    mov ah,4ch
    int 21h 
    
    
    
    
    
    

ret




