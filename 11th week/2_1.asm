.model small
.stack 100h
.data 

m1 db "Enter the size of the array : $"
m2 db "Enter the element of array : $"
m3 db " maximum element: $" 
m4 db " minimum element: $"
var db ?
ARRAY  dw d dup(?)
count dw 0 
c db ? 
d dw 0




.code


main proc 
    
    mov ax,@data
    mov ds,ax
    
    lea dx,m1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    add al,48
    mov ah,0
    mov  d, ax
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    lea dx,m2
    mov ah,9
    int 21h 
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
   
    
   xor bx,bx
    mov ah,1
    int 21h  
    lea si,ARRAY 
    
    while:
    cmp cx,d
    je end1
    mov ah,0
   
    sub ax,48
    push ax
    mov ax,10
    mul bx
    pop bx
    add bx,ax
    
  
    
     
    end2:
     mov ah,1
    int 21h
    
    cmp al,13
    je end1
    
    cmp al,32
    je end 
    jmp while
    
    end:
    
    mov [si],bx
    
    
    
    add si,2 
    xor bx,bx
    xor ax, ax
    mov ah, 1
    int 21h
    dec cl
    jmp while
     
     ;;;;;newline 
    end1: 
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    int 21h 
    mov count,4
    mov si,0
     
 
  mov cx,d
MOV DI,0 
MOV AX,0  
    
     
    COMPAIR1:

CMP AX,ARRAY[DI]
JA NEXT1
MOV AX,ARRAY[DI] 

NEXT1:
INC DI
LOOP COMPAIR1


    lea dx,m3
    mov ah,9
    int 21h
    
     mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    mov cx,d
    mov count,cx
    ;lea si,array1
    
    output1:
    mov ax,ARRAY [si]
    mov var,0
    
    output:
    cwd
    mov cx,10                                                                                  
    div cx
    
    inc var
    push dx
    cmp ax,0
    je print
    jmp output
    
    
    print:
    
      pop dx
      dec var
      add dl,48
      mov ah,2
      int 21h
      cmp var,0
      je exit1
      jmp print
      
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
    
   
