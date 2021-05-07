
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack 100h

.data
  a db 0
.code

main proc
    
    mov bh,3
    mov bl,0
    mov ah,2
    
    loop1:
    cmp bh,0
    je exit1
    mov bl,0
    
    loop2:
    cmp bl,bh
    jge exit2
    mov dl,'*'
    int 21h
    inc bl
    jmp loop2
    
    exit2:
    mov dl,10
    int 21h
    mov dl,13 
    int 21h
    dec bh
    jmp loop1
    
    exit1:
    mov ah,4ch
    int 21h
    
    main endp
end main

ret




