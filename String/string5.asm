.model small
.stack 100h
.data

st1 db 'hello'
st2 db 'hello'  

msge db 0dh,0ah,'Strings are identical$' 
msgl db 0dh,0ah,'String1 precedes string2$' 
msgg db 0dh,0ah,'String2 precedes string1$'
 
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	lea si,st1
	lea di,st2
	cld 
	  
	mov cx,5
	repe cmpsb
	jl less
	jg greater 
	 
	lea dx,msge
    mov ah,9	
    int 21h
	jmp exit 
	
less:  
    lea dx,msgl
    mov ah,9	
    int 21h
	jmp exit  
	
greater:  
    lea dx,msgg
    mov ah,9	
    int 21h
	jmp exit
	
exit:
	mov ah,4ch
	int 21h  
	
main endp
end main