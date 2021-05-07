
org 100h

.stack 100h

.data

.code

main proc
    
       mov dl,5 
       add dl,48
       mov ah,2
       int 21h
       
       jmp l1
       
       mov dl,6
       add dl,48
       mov ah,2
       int 21h
       
       l1:
       mov dl,7 
       add dl,48 
       mov ah,2 
       int 21h
     
     
    mov ah,4ch
    int 21h
    
        
    main endp
end main 

ret




