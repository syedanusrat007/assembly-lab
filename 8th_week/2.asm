
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.stack 100h

.data

.code
main proc
    
    mov al,5
    mov bl,1
    
    call sum
     
    mov ah,2
  add dl,48
  int 21h 
    main endp

sum proc
    
    add al,bl
    mov dl,al
  
  ret 
sum endp

end main
ret




