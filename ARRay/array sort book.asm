MODEL SMALL
 .STACK lOOH
 .DATA



 CODE_KEY DB 65 DUP (' 'l, 'XQPOGHZBCADEIJWFMNl<LRSTWY'
 DB 3 7 DUP (' ' )
 DECODE_KEY DB 65 DUP (' '),'JHIKLQEFMNTURSDcavwxOPYAZG'
 DB 37 DUP (' 'l
 CODED DB 80 PUP('$')
 PROMPT
 CRLF
 .CODE
 MAIN

DB 'ENTER A MESSAGE:',ODH,OAH,'S'



;print
DB ODH, OAH,' $'
PROC
MOV AX,@DATA
MOV OS, AX
input
MOV
LEA.
INT
prompt
AH,9
DX,PP.OMPT
21H

;read and encode message
MOV AH, 1
LEA BX,CODE_KEY
23: LEA DI, CODED
 WHILE_

 CMP AL, OOH
27: JE ENO\-IHILE
28: XLA.
;ini~iaiize DS
; pr int string -fen
;DX pts to prompt ,
;print message
; read char fen
;BX pts to code key
;DI. pts to coded message
; read a char
;carriage return?
; yes, go to print coded messa~
; no, encode char
·'
Chapter 10 Arrays and Addressing Modes 199
29: MOV , (DI) ,AL
30:· INC r_DI
;store in coded message
;move pointer
31: JMP WHILE -
32: ENDWHILE:
33: ;go to a new llric
34 :' MOV AH,9
35; LEA DX,CRLF
36: INT 21H
37; ;print encoded me·ssage
38:
,
LEA DX, CODED
39: INT 2lH
40: ;go to a new line
41: LEA DX,CRLF
42: INT 21H
43: ;decode message· and print
44: MOV All, 2
45: LEA BX, DECODE - KEY
46: LEA SI,CODED
47: WHILEl: ~ ? ,.
48: MOV ., ~L, [SI)
49: CMP AL,' S'
SC: JE ENDWHILEl
51: XLAT
52: MOV ·o'i,·,AL
53: INT 21H,
54: INC SI
;process next char
·;new line
·,DX pt s to coded
;print coded ;;-.essa9e
; new 1 ine
it
;p:i:int <.:h.:tr fen
;BX ~ts to decode key
.ts tc ancodect message
; get a character frr·- messuge
; end of messar;;· ·
; yes, exj t.
; no, decode character
;put in DL
;print translated char
;move ptr
55 :_.: JMP 1·WHILE1 ; process next ch.:•:
56: ENDWHILEl:
57: MOV' AH: 4<:H
58: INT : 2lH ;dos exit
59: MAIN ' ENDP
60: END. MAIN