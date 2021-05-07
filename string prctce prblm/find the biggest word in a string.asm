
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.data

string1 db 30 dup(?)
string2 db 30 dup(?)  
msg1 db "Input : $"
msg2 db "Output : $" 
max db 0         
n db 0

.code
main proc 
    
    mov ax,@data
    mov ds,ax
    mov es,ax    
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    lea di,string1
    cld
    
    xor bx,bx
    mov ah,1
    int 21h 
    
    ip:
    cmp al,13
    je checkGreater
    cmp al,' '
    je checkGreater
    inc bl
    stosb
    mov ah,1
    int 21h
    jmp ip 
    
    checkGreater:
    cmp max,bl
    jl copy
    lea di,string1
    xor bl,bl
    cmp al,13
    je o
    mov ah,1
    int 21h
    jmp ip
    
    
    copy:
    xor ch,ch
    mov cl,bl
    mov max,bl 
    lea si,string1
    lea di,string2
    rep movsb     
    xor bl,bl
    lea di,string1
    cmp al,13
    je o
    mov ah,1
    int 21h
    jmp ip
    

    o:  
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    lea si,string2
    mov cl,max
    xor ch,ch
    
    output: 
    lodsb
    mov dl,al
    mov ah,2
    int 21h
    loop output
    
    main endp
end main

ret




