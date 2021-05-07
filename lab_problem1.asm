.model small
.stack 100h
.data

m1 db 'Input : $'
m2 db 13,10,'Output : $' 
n db ?

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

mov ch,cl
shl ch,1 
sub ch,1
 
mov bl,1

lea dx,m2
mov ah,9
int 21h

mov dl,10
mov ah,2
int 21h
mov dl,13
mov ah,2
int 21h 

mov dl,10
mov ah,2
int 21h
mov dl,13
mov ah,2
int 21h

outer_top:
    cmp bl,cl
    jg exit
    
    mov bh,1
    inner1_top: 
        cmp bh,bl
        jge inner1_bottom:
        
        mov dl,' '
        mov ah,2
        int 21h
        
        inc bh
        jmp inner1_top 
        
      
    inner1_bottom:
    
    test bl,01h 
    jnz  even
    
    mov bh,1  
    inner2_top: 
        cmp bh,ch 
        jg outer_bottom
        mov dl,bh
        add dl,48
        mov ah,2
        int 21h
        inc bh
        jmp inner2_top
    even:
        
        mov bh,ch
        inner3_top:
            cmp bh,0
            jle outer_bottom 
            mov dl,bh 
            add dl,48
            mov ah,2
            int 21h
            dec bh
            jmp inner3_top
           
           
    outer_bottom:
        mov dl,10
        mov ah,2
        int 21h
        mov dl,13
        mov ah,2
        int 21h
         
        inc bl
        sub ch,2
        jmp outer_top


exit:
mov ah,4ch
int 21h
 
main endp
end main
