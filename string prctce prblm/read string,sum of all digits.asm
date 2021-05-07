
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h



org 100h

.model small
.data 
string1 db 20 dup(?)    
string2 db 20 dup(?)
msg1 db "Enter String: $"  
msg2 db "Sum of the digits is : $"

sum db 0

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
    
    cmp al,57
    jle dekhoDigitKina
    
    inc si  
    int 21h 
    jmp ip 
    
    dekhoDigitKina:
    cmp al,48
    jge sumkoro
    inc si  
    int 21h 
    jmp ip
    
    
    sumkoro:
    sub al,48
    add al,sum
    mov sum,al
    inc si  
    int 21h 
    jmp ip
    
    
    
    berhow:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov dl,sum
    add dl,48
    mov ah,2
    int 21h
    

    
    
    



ret




