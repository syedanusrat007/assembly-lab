.model small

.stack 100h

.data

st1 db 20 dup(?)

.code

main proc
	mov ax,@data
	mov ds,ax
	mov es,ax

	lea di,st1 
	
	cld
	xor bx,bx
	mov ah,1
	int 21h
	
	cmp al,65
	jge upper
	
	
	

input:
	cmp al,0dh
	je load	
	
	
	
	t:
	
	stosb
	inc bx
	mov ah,1
	int 21h
	cmp al,32
	je spa
	jmp input 
	
	upper:
	sub al,32
	jmp input
	
	spa:  
	
	stosb
	inc bx 
	mov ah,1
	int 21h
	cmp al,65
	jge u
	
	u:
	sub al,32
	jmp t
	
	

load:  

mov ah,2
mov dl,10
int 21h
mov dl,13
int 21h 

    lea si,st1	   
	cld
	mov cx,bx

top:
	lodsb
	mov ah,2
	mov dl,al	
	int 21h

Loop top



	mov ah,4ch
	int 21h

main endp

end main