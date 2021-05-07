.model small
.stack 100h
.data

st1 db 'hello'  

yes db 'yes$' 
no db 'no$' 
 
.code
main proc
	mov ax,@data
	mov ds,ax
	mov es,ax
	
	lea di,st1
	cld      
	mov al,'l' 
	
	mov cx,5
	REPNE SCASB
	  
	jne no_
	 
	lea dx,yes
    mov ah,9	
    int 21h
	jmp exit 
	
no_:  
    lea dx,no
    mov ah,9	
    int 21h
	jmp exit  

	
exit:
	mov ah,4ch
	int 21h  
	
main endp
end main