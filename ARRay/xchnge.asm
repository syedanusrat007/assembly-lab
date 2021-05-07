.MODEL SMALL
.STACK 100H
.DATA
ARRAY DW 18,21,33,45,25

var db ?
count db ?
c db 0

.CODE
MAIN PROC

MOV AX,@DATA
MOV DS,AX

 mov count, 5

mov ax,ARRAY
xchg ARRAY[4],ax
mov ARRAY,ax
 


 

output1:
    mov ax,ARRAY[di]
    mov var,0
    
    output:
    cwd
    mov cx,10                                                                                  
    div cx
    
    inc var
    push dx
    cmp ax,0
    je print1
    jmp output
    
    
    print1:
    
      pop dx
      dec var
      add dl,48
      mov ah,2
      int 21h
      cmp var,0
      je exit1
      jmp print1
      
      exit1:
      dec count
      cmp count,0
      je exit
      add si,2
      
      mov dl,10
      mov ah,2
      int 21h
      
      mov dl,13
      int 21h
      
      jmp output1
      
      exit:
      mov ah,4ch
      int 21h
      


END MAIN
MAIN ENDP