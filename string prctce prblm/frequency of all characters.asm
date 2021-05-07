
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h



org 100h

.model small
.data 
string1 db 20 dup(?)    
string2 db 20 dup(?)
msg1 db "Enter String: $"  
msg2 db "Frequency : $"
msg3 db " is : $"

freq db 0
storeLetter db 0 

countLength db 0
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
    inc countLength
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
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    
    lea si,string1 
    mov cl,countLength
    xor ch,ch
    
    
    OuterTop:
    cmp cl,0
    je OuterBottom
    
    lea di,string1
    mov bl,countLength
    mov freq,0 
    mov al,[si]
    
    innerTop:
    cmp bl,0
    je innerBottom
     
    cmp al,'0'
    je innerBottom
    
    cmp [di],al
    je  incfreq 
    
    inc di
    dec bl
    jmp innerTop
    
    incfreq:
    inc freq
    mov [di],'0'
    inc di
    dec bl
    jmp innerTop
     
     
    innerBottom:
    inc si
    dec cl
    cmp al,'0'
    jne print
    jmp OuterTop
    
    print:
    mov storeLetter,al 
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
     
      
    mov ah,2
    mov dl,storeLetter
    int 21h
    mov dl,' '
    int 21h
    
    mov ah,9 
    lea dx,msg3
    int 21h 
    
    mov ah,2
    
    mov dl,freq
    add dl,48
    int 21h 
    
    jmp OuterTop
    
    
    OuterBottom:
    mov ah,2
    mov dl,10 
    int 21h
    mov dl,13
    int 21h 
    exit:




ret




