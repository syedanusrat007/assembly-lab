
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h

.data

.code

main proc
    mov bl,2
    mov al,4
    div bl
    
    mov ah,2
    mov  dl,al
    add dl,48
    int 21h

ret




