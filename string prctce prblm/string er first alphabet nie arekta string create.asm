
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.data

string1 db 50 dup(?)  
string2 db 50 dup(?)
msg1 db "Input : $"
msg2 db "Output : $"

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
    
    lea si,string2
    cld
    
    xor bx,bx
    mov ah,1
    int 21h 
    
    cmp al,97
    jge firstcap
    mov [si],al
    inc si
    inc bl
    jmp ip
    
    
    firstcap:
    sub al,32
    mov [si],al
    inc si 
    inc bl
    add al,32
    
    ip:
    cmp al,13
    je o
    cmp al,' '
    je check
    mov ah,1
    int 21h
    jmp ip  
    
    check:  
    mov ah,1
    int 21h
    
    cmp al,'o'
    je newip
    cmp al,'a'
    je newip
    
    cmp al,97
    jge capital
    
    inc bl
    
    mov [si],al
    inc si
    
    newip: 
    mov ah,1
    int 21h
    jmp ip
    
    capital:
    inc bl
    sub al,32
    mov [si],al
    inc si
    mov ah,1
    int 21h
    jmp ip 
    
    
    o: 
    
    oinit:
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
    mov cl,bl
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




