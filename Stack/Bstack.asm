org 100h
.model small
.stack 100h
.data    
msg1 db 'Enter The stack size: $'
msg2 db 'choose an option:1.push 2.pop 3.is empty? 4.is full? 5.Exit.'
msg3 db 'Enter a value to push in the stack: $'
msg4 db 'The stack is full.'
msg5 db 'The stack is not full.'
msg6 db 'The stack is empty.'
msg7 db 'The stack is not empty.'
msg8 db 'Popped value:'
count db ?
a db ? 
.code
main proc                         
    
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,9
    int 21h
        
    mov ah,1
    int 21h
    
    mov a,al 
        
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
        
        
        
        
        lea dx,msg2
        mov ah,9
        int 21h
        
        mov ah,1
        int 21h
        
        cmp al,49
        je fun1
        
        fun1:
        lea dx,msg3
        mov ah,9
        int 21h
        
        xor bx,bx
        xor cx,cx
        
        while1:
        mov ah,1
        int 21h
        
        cmp al,13
        je space1
        
        mov ah,0
        sub ax,48
        push ax
        
        mov ax,10
        mul bx
        pop bx
        add bx,ax
        jmp while1
        
        space1:
        mov dl,10
        mov ah,2
        int 21h
        mov dl,13
        mov ah,2
        int 21h
        
        
          
        
        lea dx,msg2
        mov ah,9
        int 21h
        
        mov ah,1
        int 21h
        
        cmp al,50
        je fun2
        
        fun2:
        
        
        
        
        
        
        
        
        
        
        
    
        
        
        cmp al,51
        je fun3
        
        
        
        
        
        
        
        cmp al,52
        je fun4
        
        fun4:
        cmp a,bx
        je  full
        
        lea dx,msg5
        mov ah,9
        int 21h
        
        full:
        lea dx,msg4
        mov ah,9
        int 21h
        
        
        

        
        cmp al,53
        je fun5
        
        fun5:
        ret
        
        
        
            
        
        
        
        
        
    
    