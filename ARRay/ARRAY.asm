
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
.model small
.stack 100h
.data
array1 dw 23,45,12,34
var db ?
count db ?
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov count, 4
    ;lea si,array1
    
    output1:
    mov ax,array1[si]
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
      
      main endp
end main

ret




