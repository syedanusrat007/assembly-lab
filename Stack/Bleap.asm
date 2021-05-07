org 100h
.model small
.stack 100h
.data    
msg1 db 'Enter The year: $'
msg2 db 'It is a leap year.'
msg3 db 'It is not a leap year.'
count db ? 
.code
main proc                         
    
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    mov ah,9
    int 21h
    
    call input
    
    
    mov dl,10
    mov ah,2
    int 21h
    
    mov dl,13
    mov ah,2
    int 21h
    
    add cx,bx
    
    mov ax,cx
    
    call output
    
    input proc 
        xor bx,bx
        xor cx,cx
        
        while1:
        mov ah,1
        int 21h
        
        cmp al,13
        je ball 
        
        mov ah,0
        sub ax,48
        push ax    
        mov ax,10
        mul bx
        pop bx
        add bx,ax
        jmp while1
        ball:
        mov dl,10
        mov ah,2
        int 21h
        mov dl,13
        mov ah,2
        int 21h 
        ;bal:
        ;mov ah,1
        ;int 21h
        ;cmp al,13
        ;je bal2
        ;mov ah,0
        ;sub ax,48
        ;push ax
        ;mov ax,10
        ;mul cx
        ;pop cx
        ;add cx,ax
        ;jmp bal
        ;bal2:
        ;ret 
        
    output proc
          mov count,0
          while2:
          cwd
          inc count
          mov bx,10
          div bx
          push dx
          cmp ax,0
          jne while2
          
          print:
          cmp count,0
          je break
          pop dx
          add dx,48
          mov ah,2
          int 21h
          dec count
          jmp print
          break: