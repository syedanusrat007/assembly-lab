.model small
.stack 100h

.data  

string1 db 'hello'
string2 db 5 dup (?)

.code

main proc  
    
    
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    lea si,string1
    lea di,string2
    cld
    movsb
     
     
     
     level:
     mov cx,5
   
    mov di,0
    
     
    
    top:
    mov ah,2
    mov dl,[di]
    int 21h
    
    add di,1
    loop top
    

    main endp
    end main