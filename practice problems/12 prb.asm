
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small

.stack 100h

.data


msg1 db "Enter a mark  : $"
msg2 db "Grade A $"
msg3 db "Grade B $"
msg4 db "Grade C $"
msg5 db "Grade D $"
msg6 db "Grade E $"
msg7 db "Grade F $"



.code

main proc
    
    mov ax,@data
    mov ds,ax
     
    lea dx,msg1
    mov ah,9
    int 21h  
   
    call input 
    
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h 
    
    mov ax,bx
    
  
    
   
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
     
    
    cmp ax,40
    jge F
    
   
    
    l1:
    cmp ax,50
    jge E 
   
    
    
    l2:
    cmp ax,60
    jge D
    
   
   
    l3:
    cmp ax,70
    jge C
   
    
   
    l4:
    cmp ax,80
    jge B
   
   
    l5:
    cmp ax,90
    jge A
    
    p1:
    
    lea dx,msg7
    mov ah,9
    int 21h
    jmp exit
    
    p2:
    lea dx,msg6
    mov ah,9
    int 21h
    jmp exit
    
     p3:
    lea dx,msg5
    mov ah,9
    int 21h
    jmp exit 
    
    
    p4:
     lea dx,msg4
    mov ah,9
    int 21h
    jmp exit 
    
     p5:
    
    lea dx,msg3
    mov ah,9
    int 21h
    jmp exit
    
    A:
    lea dx,msg2
    mov ah,9
    int 21h
    jmp exit
    
     B:
    cmp ax,90
    jl p5
    jmp l5
     
     C:
    cmp ax,80
    jl p4
    jmp l4 
    
     D:
    cmp ax,70
    jl p3
    jmp l3   
    
     E:
    cmp ax,60
    jl p2 
    jmp l2    
     F:
    cmp ax,50
    jl p1
    jmp l1
    
    
  exit:
     
   
  mov ah,4ch
    int 21h 
    
    
    
    main endp 
    
    input proc
          
    xor bx,bx
    mov ah,1
    int 21h
    
    while:
    mov ah,0
    sub ax,48
    push ax
    mov ax,10
    mul bx
    pop bx
    add bx,ax
    
    mov ah,1
    int 21h
    cmp al,0dh
    jne while
    ret
    input endp 
    
  
  

end main

ret



