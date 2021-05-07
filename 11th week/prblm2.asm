.MODEL SMALL
.STACK 100H
.DATA
ARRAY DB 12,11,23,24,20,10


.CODE
MAIN PROC

MOV AX,@DATA
MOV DS,AX

MOV CX,6
MOV DI,0 
MOV AX,0


COMPAIR:

CMP AL,ARRAY[DI]
JA NEXT
MOV AL,ARRAY[DI] 

NEXT:
INC DI
LOOP COMPAIR

xor cx,cx 
    mov bx,10
    
    repeat:
    CWD
    div bx
    push dx
    inc cx
    cmp ax,0
    jne repeat
    
    print:
    
    pop dx
    add dl,48
    mov ah,2
    int 21h
    loop print
     

 



END MAIN
MAIN ENDP