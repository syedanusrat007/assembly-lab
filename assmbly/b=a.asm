.model small
.stack 100h
.data

a DB ? 
b DB ?


.code 

main proc
    
    mov ah,1
    int 21h
    
    mov a,al
    mov al,a
    mov b,al  
    
    
    mov ah,2
    mov dl,b 
    int 21h
    
main endp

end main