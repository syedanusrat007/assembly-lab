
org 100h

.model small
.data

msg1 db "please enter the input : $"
msg2 db "total number of even digits in input : $"
ceven db 0

.code

main proc
     
     
     mov ax,@data
     mov ds,ax
     
     mov ah,9
     lea dx,msg1
     int 21h
     
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     mov ah,1
     int 21h
     
   while:
     cmp al,13
     je exit
     sub al,48
     shr al,1
     jnc even
     int 21h
     jmp while
    
    
   even:
     inc ceven
     int 21h
     jmp while
     
   exit:
   
     mov ah,2
     mov dl,10
     int 21h
     mov dl,13
     int 21h
     
     mov ah,9
     lea dx,msg2
     int 21h
     
     mov ah,2
     mov dl,ceven
     add dl,48
     int 21h    
     
     
    
main endp
end main

ret




