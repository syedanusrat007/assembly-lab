
org 100h

.model small
.data
n db 0
x db 0
tmp db 1
i db 0
j db 0

.code

main proc
      mov ax,@data
      mov ds,ax
      
      mov ah,1
      int 21h
      sub al,48
      
      mov n,al
      
      add al,al
      sub al,1
      
      mov x,al
      
      mov i,1
      mov ah,2
      mov dl,10
      int 21h
      mov dl,13
      int 21h
      mov al,n
      
   outerT:
       cmp i,al
       jg outerB
       mov bl,i     
       mov tmp,bl
       mov cl,tmp
       mov j,cl
     spaceT:
       cmp j,1
       jle spaceB
       mov dl,' '
       mov ah,2
       int 21h
       dec j
       jmp spaceT 
     
     spaceB:
     
       mov tmp,1
       mov al,x
       mov j,al
       
     printT:
       cmp j,1
       jl printB
       mov ah,2
       cmp tmp,1
       je  print1
       mov tmp,1
       mov ah,2
       mov dl,31h
       int 21h
       dec j
       jmp printT
       
     print1:
       mov tmp,2
       mov ah,2
       mov dl,31h
       int 21h
       dec j
       jmp printT  
       
       
     printB:
       mov ah,2
       mov dl,10
       int 21h
       mov dl,13
       int 21h
       mov al,n
       inc i
       sub x,2
       jmp outerT    
   
       
   outerB:    

main endp
end main    

ret




