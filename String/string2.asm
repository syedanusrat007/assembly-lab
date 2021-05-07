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
    
    lea si,string1+4
    lea di,string2
    std  
    mov cx,5
    top:  
    mov ah,2
    mov dl,[si]
    int 21h
    movsb     
    add di,2
    loop top
    ;movsb
    

    main endp
    end main