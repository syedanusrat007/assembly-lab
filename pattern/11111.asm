

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
    mov bh,1
    
    outT:
    cmp bh,n
    jg outB
    
    mov ch,n 
    in1T:
    cmp ch,bh
    jl in1B
    
    test bh,01h
    jz even
    
    mov ah,2
    mov dl,'1'
    int 21h
    dec ch
    jmp in1T     
    
    even:       
    mov ah,2
    mov dl,'0'
    int 21h
    dec ch
    jmp in1T
   
    
    
    in1B:
     
     mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    
    inc bh
    
    jmp outT
    
   outB:
   
   exit: 
    
    
    main endp
end main
    
    

ret








