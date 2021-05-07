
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h



org 100h

.model small
.data 
string1 db 20 dup(?)    
string2 db 20 dup(?)
msg1 db "Enter String: $"  
msg2 db "Total number of words: $" 
msg3 db "words : $"
countLength db 0
countWord db 0
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
    cmp al,' '
    je word 
    mov [si],al
    inc si  
    int 21h 
    inc countLength
    jmp ip
    
    word:
    inc countWord
    mov [si],al     
    inc si  
    int 21h 
    jmp ip
    
    
   
    
    berhow:
    inc countWord
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
    
    mov dl,countWord
    add dl,48
    mov ah,2
    int 21h
              
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx,msg3
    int 21h
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
    
    lea si,string1 
    mov cl,countLength
    xor ch,ch
    
    
    printWord:
    cmp cl,0
    je exit
    cmp [si],' '
    je printNewLine
    mov dl,[si]
    mov ah,2
    int 21h
    inc si
    dec cl
    jmp printWord
    
    
    printNewLine:
    mov ah,2
    mov dl,10 
    int 21h
    mov dl,13
    int 21h 
    inc si
    jmp printWord 
    
    exit:




ret




