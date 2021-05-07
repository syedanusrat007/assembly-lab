

; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.data
string1 db 5 dup(?)
string2 db 5 dup(?)   
n db 0  
n2 db 0
maxl db 0
max db 0
c1 db 0

.code 

main proc
    
    mov ax,@data
    mov ds,ax
    mov es,ax
     
    lea di,string1
    cld
    mov cx,5
    mov ah,1
    int 21h
    
    top:
    cmp al,13
    je op    
    stosb
    inc bx
    int 21h
    jmp top
    
    op:
    mov cx,bx
    mov n,bl  
    mov n2,bl
    lea si,string1 
    lea di,string1
    
    
    outerTop: 
    cmp  n,0
    je exit
    
    mov cl,[si] 
    lea di,string1
    mov n2,bl
    mov c1,0
    
    innertop:
    cmp n2,0
    je innerbottom
    cmp [di],'0'
    je decr
    cmp [di],cl
    jne decr
    inc c1
    mov [di],'0'
    inc di
    dec n2
    jmp innertop
    
    decr:
    inc di
    dec n2
    jmp innertop
    
    innerbottom:
    mov dl,c1
    cmp max,dl
    jl store
    inc si
    dec n
    jmp outertop
    
    store:
    mov max,dl
    mov dl,cl
    mov maxl,dl
    dec n
    inc si
    jmp outertop
    
    
    exit:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    
    mov dl,maxl
    mov ah,2
    int 21h
    

    
   main endp
end main

ret




