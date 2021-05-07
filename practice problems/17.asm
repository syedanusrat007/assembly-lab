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
    
 
    mov bh,1 
    test bl,01h
    jz in3T
    
    in2T:
    cmp bh,bl
    jg in2b
    
    test bh,01h
    jz even
    
    mov ah,2
    mov dl,'1'
   
    int 21h 
  
    
    inc bh
    jmp in2T
    
    even:
    mov ah,2
    mov dl,'0'
   
    int 21h 
   
    
    inc bh
    jmp in2T
    
    
    in3T:
    cmp bh,bl
    jg in2b
    
    test bh,01h
    jz even1
    
    mov ah,2
    mov dl,'0'
   
    int 21h 
   
    
    inc bh
    jmp in3T
    
    even1:
    mov ah,2
    mov dl,'1'
   
    int 21h 
    
    inc bh
    jmp in3T
    
    
    
    in2B:
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



