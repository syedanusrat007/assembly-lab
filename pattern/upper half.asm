
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
.stack 100h
.model small

.data
a db 0
msg1 db "input : $"
msg2 db "output : $"

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
    
    mov cl,a
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    lea dx,msg2
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    mov bl,1
    
    outT:
    cmp bl,cl
    jg exit
    
    mov dh,cl
    
    in1T:
    cmp dh,bl
    jl in1B
    
    mov ah,2
    mov dl,' '
    int 21h
    
    dec dh
    jmp in1T
    
    in1B:
    
    mov bh,1
    
    in2T:
    
    cmp bh,bl
    jg in2B
    
    mov ah,2
    mov dl,bh
    add dl,48
    int 21h
    
    mov ah,2
    mov dl,' '
    int 21h
    
    inc bh
    jmp in2T
    
    in2B:
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    inc bl
    
    jmp outT 
    
    exit:
    
    mov ah,4ch
    int 21h
    
    

ret



