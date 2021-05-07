.model small

.stack 100h

.data

st1 db 10 dup(?)

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

input:
	cmp al,0dh
	je load	
	
	stosb
	inc bx
	int 21h
	jmp input

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