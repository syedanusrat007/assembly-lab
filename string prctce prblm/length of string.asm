
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.data 
string1 db 20 dup(?) 
msg1 db "Length of string is : $"
count db 0
.code
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    cld
    lea si,string1
    
    mov ah,1
    int 21h  
    
    ip:
    cmp al,13
    je berhow 
    mov [si],al
    inc si  
    int 21h 
    inc count
    jmp ip
    
    berhow:
    
    mov cl,count
    xor ch,ch
    lea si,string1 
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    printString:
    mov dl,[si]
    inc si
    mov ah,2
    int 21h
    loop printString   
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx,msg1
    int 21h 
    
    decOpInit: 
    xor ah,ah
    mov al,count
    mov bl,10 
    mov count,0
    
    decOp:
    cmp ax,0
    je printCountinit
    div bl
    mov dl,ah
    xor dh,dh
    push dx
    xor ah,ah
    inc count
    jmp decOp
    
    printCountinit:
    cmp count,0
    je shesh
    
    mov ah,2
    pop dx 
    add dl,48
    int 21h
    dec count
    jmp printCountinit 
    
    shesh:
    mov ah,4ch
    int 21h
      
    
    
    main endp
end main

ret




