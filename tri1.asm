.stack 100h
.data
i db ?
j db ?
n db ?
m1 db "input : $"
m2 db "output : $"

.code

main proc
    
   mov ax,@data
   mov ds,ax
   
   lea dx,m1
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   sub al,48
   mov cl,al 
    
   
   mov ah,2
   mov dl,10
   int 21h
   mov dl,13
   int 21h
     
   mov bl,0
   outer_top:
   
   cmp bl,cl
   jg exit 
   inc bl
     
    mov bh,1
    inner_top:
    
    cmp bh,bl
    jge inner_bottom
          
    mov ah,2
    mov dl,bh
    add dl,48
    int 21h
    
    inc bh
    
    jmp inner_top
    
    
 inner_bottom:
    
   mov ah,2
   mov dl,10
   int 21h
   mov dl,13
   int 21h
   jmp outer_top
   
   exit:
  
    
    
    
    main endp
end main
ret