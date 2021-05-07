.MODEL SMALL
.STACK 100H
.DATA 

msg1 db 10,13,'They are divisible $'
msg2 db 10,13,'They are not divisible $'
.CODE


main proc
    mov ax,@data
    mov ds,ax
    
xor bx,bx
xfvhsbc:
	mov ah,1
	int 21h
	cmp al,0dh
	je bwfxg
	mov ah,0
	sub al,48
	push ax
	mov ax,10
	mul bx
	pop bx
	add bx,ax
	jmp xfvhsbc
	
bwfxg:

    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h  
    
 mov cl,bl  

MOV AH,1
INT 21H
SUB AL,48
MOV BH,AL

  mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 



mov al,bl
mov ah,0

DIV BH;BL/BH

MOV CL,AL   ; vagfol
ADD CL,48

MOV CH,AH
ADD CH,48     ; vagshesh

     
    

cmp ch,'0'
je divi
      
         
    
    lea dx,msg2
    mov ah,9
    int 21h
    
    mov ah,2
mov dl,bh
add dl,48
int 21h
    
    jmp exit
     

divi:
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    mov ah,2
mov dl,bh
add dl,48
int 21h 

 
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
 exit:
 
 main endp


end main