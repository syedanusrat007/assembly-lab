
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack 100h
.model small
.data

msg1 db "input : $"
msg2 db "output : $"
n db 0


.code

main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    mov cl,al
    sub cl,48 
    
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
    
    mov n,cl
    mov bl,1
    
    outT:
    cmp bl,n
    jg outB
    
    mov ch,n 
    in1T:
    cmp ch,1
    jl in1B
    cmp ch,bl
    je star      
           
    mov ah,2
    
    mov dl,ch
    add dl,48 
    int 21h
     dec ch
    jmp in1T
    
    star:
     mov ah,2
     mov dl,'*'
    int 21h
    dec ch
     jmp in1T
    
    
    in1B:
     
     mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    inc bl
    
    jmp outT
    
   outB:
   
   exit: 
    
    
    main endp
end main
    
    

ret




