
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h



org 100h

.model small
.data 
string1 db 10 dup(?)    
string2 db 10 dup(?)
msg1 db "Enter String: $"
cap db 0 
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
    cmp al,90
    jle checkCap 
    mov [si],al
    inc si  
    int 21h 
    jmp ip
    
    checkcap:
    cmp al,65
    jge againCheckCap
    mov [si],al
    inc si  
    int 21h 
    jmp ip
    
    againCheckCap:
    cmp count,0
    je storekoro
    mov [si],al
    inc si  
    int 21h 
    jmp ip
    
    storekoro:
    mov cap,al
    mov [si],al
    inc si  
    int 21h 
    inc count
    jmp ip
    
    berhow:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov dl,cap
    mov ah,2
    int 21h
    
    




ret




