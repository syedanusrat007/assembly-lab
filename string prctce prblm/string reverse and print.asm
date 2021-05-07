

org 100h

.model small
.data 
string1 db 5 dup(?)    
string2 db 5 dup(?)
msg1 db "Enter String: $"
msg2 db "Reverse String: $"
count db 0
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
    
    lea si,string1
    mov cl,count
    lea di,string2+4 
    
    reversekoro:
    cmp count,0
    je print
    mov al,[si]
    mov [di],al
    inc si
    dec di
    dec count
    jmp reversekoro
    
    
    print:
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
    
    
    shesh:
    mov ah,4ch
    int 21h
      
    
    
    main endp
end main

ret




