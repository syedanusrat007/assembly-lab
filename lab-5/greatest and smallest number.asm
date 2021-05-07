
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.data 

x db 0
y db 0
z db 0
tmp db 0
msg1 db "The greatest number is : $"
msg2 db "The smallest number is : $" 

.code

mov ax,@data
mov ds,ax

mov ah,1      ; taking input
int 21h
sub al,48     ; subtracting 48 to get real value
mov x,al      ; moving value from register to variable


mov ah,1      
int 21h
sub al,48     
mov y,al 



mov ah,1      
int 21h
sub al,48     
mov z,al

mov al,x          ; storing value of x in al reg

cmp al,y           ; checking if x is greater than y
jge greater        ;if x greater than y , then jump to greater
mov al,y           ; if x less than y ,then store value of y in al
jmp greater        ; jump to greater


greater:            
cmp al,z           ; in al reg we have the greater number between x and y , now compare the greater number with z
jge greatest       ; if the number in al reg is greater than z, jump to greatest
mov al,z           ; if not , then store value of z in al
jmp greatest       ; jump to greatest


greatest:
mov tmp,al         ; in al now we have the greatest number, move the greatest number into a variable

mov ah,2           ; print newline
mov dl,10
int 21h

mov ah,2           ;print carriage return
mov dl,13
int 21h


mov ah,9           ; print message 1
lea dx,msg1
int 21h

mov ah,2           ; print the greatest number
mov dl,tmp
add dl,48
int 21h


; for smallest number

mov al,x

cmp al,y
jle smaller
mov al,y
jmp smaller


smaller:
cmp al,z
jle smallest
mov al,z
jmp smallest


smallest:
mov tmp,al

mov ah,2
mov dl,10
int 21h

mov ah,2
mov dl,13
int 21h


mov ah,9
lea dx,msg2
int 21h

mov ah,2
mov dl,tmp
add dl,48
int 21h










ret




