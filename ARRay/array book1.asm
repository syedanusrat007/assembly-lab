.MODEL SMALL
.STACK 100H
.DATA
ARRAY DB 18,21,33,45,25


.CODE
MAIN PROC

MOV AX,@DATA
MOV DS,AX





PUSH AX ;save registers
PUSH BX
PUSH cx
PUSH SI
PUSH DI
;make DI point to nth word
mOV DI,SI
MOV CX,BX
DEC BX
ShL BX,1
ADD DI,BX
SHR cx,1
;swap element.s
XCHG_LOOP:
MOV AX, [SI ]
XCHG AX, [DI]
MOV [SI] ,AX
ADD SI,2
SUB DI,2
LOOP XCHG_LOOP
POP DI
POP SI
POP cx
POP BX
POP AX 




END MAIN
MAIN ENDP
