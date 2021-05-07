
.model small
.stack 100h
.data 

m1 db "Enter the size of the array : $"
m2 db "Enter the element of array : $"
m3 db " occurred $" 
m4 db " times $"
var db ?
a dw d dup(?)
count db ? 
c db ? 
d db 0 
z db 0
y db 0
x db 0
w db 0
u db 0
v db 0 
t db 0
q db 0
p db 0
l db 0

.code


main proc 
    
    mov ax,@data
    mov ds,ax
    
    lea dx,m1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    add al,48
    mov d,al
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    lea dx,m2
    mov ah,9
    int 21h 
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    
   xor bx,bx
    mov ah,1
    int 21h  
    lea si, a
    
    while:
    cmp cl,d
    je end1
    mov ah,0
   
    sub ax,48
    push ax
    mov ax,10
    mul bx
    pop bx
    add bx,ax
    
    
    cmp bx,0
    je zero
    cmp bx,1
    je one 
    cmp bx,2
    je two
    cmp bx,3
    je three
    cmp bx,4
    je four
    cmp bx,5
    je five
    cmp bx,6
    je six
    cmp bx,7
    je seven
    cmp bx,8
    je eigth
    cmp bx,9
    je nine
    
     
    end2:
     mov ah,1
    int 21h
    
    cmp al,13
    je end1
    
    cmp al,32
    je end 
    jmp while
    
    end:
    
    mov [si],bx
    
    
    
    add si,2 
    xor bx,bx
    xor ax, ax
    mov ah, 1
    int 21h
    dec cl
    jmp while
     
     ;;;;;newline 
    end1: 
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    int 21h 
    mov count,4
    mov si,0
    
    
    
     
     exit1:
     cmp l,0
     jg low0
     a1: 
    cmp z,0
    jg low1
   b: 
  cmp y,0
    jg low2 
    
     c1:
    cmp x,0  
    jg low3
    d1:
    cmp q,0
    jg low4
    e:
    cmp p,0
    jg low5
    f:
    cmp u,0
    jg low6
     g:
    cmp v,0
    jg low7
    h:
    cmp t,0
    jg low8
    i:
    cmp w,0
    jg low9
    
    
    
     
   exit:  
    
    mov ah,4ch
    int 21h
    zero:
    inc l
    jmp end2 
    
    one:
    inc z 
    jmp end2
    
    two:
    inc y
    jmp end2
    three:
   
    inc x 
    jmp end2
    four:
    inc q 
    jmp end2
    five:
    inc p 
    jmp end2
    six:
    inc u 
    jmp end2
   seven:
    inc v 
    jmp end2
    eigth:
    inc t 
    jmp end2 
    
    nine:
     inc w 
    jmp end2 
    
    
    low0: 
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    int 21h
    
     mov ah,2
     mov dl,'0'
     int 21h
    
     lea dx,m3
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,l
    add dl,48
    int 21h
    
    lea dx,m4
    mov ah,9
    int 21h
    jmp a1  
    
    low1: 
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    int 21h
    
     mov ah,2
     mov dl,'1'
     int 21h
    
     lea dx,m3
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,z
    add dl,48
    int 21h
    
    lea dx,m4
    mov ah,9
    int 21h
    jmp b  
    
    low2: 
    
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    int 21h
    
     mov ah,2
     mov dl,'2'
     int 21h
    
     lea dx,m3
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,y
    add dl,48
    int 21h
    
    lea dx,m4
    mov ah,9
    int 21h
    jmp c1
    
    low3: 
    
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    int 21h
    
     mov ah,2
     mov dl,'3'
     int 21h
    
     lea dx,m3
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,x
    add dl,48
    int 21h
    
    lea dx,m4
    mov ah,9
    int 21h
    jmp d1
    
    low4: 
    
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    int 21h
    
     mov ah,2
     mov dl,'4'
     int 21h
    
     lea dx,m3
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,w
    add dl,48
    int 21h
    
    lea dx,m4
    mov ah,9
    int 21h
    
    jmp e
    
    low5: 
    
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    int 21h
    
     mov ah,2
     mov dl,'5'
     int 21h
    
     lea dx,m3
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,q
    add dl,48
    int 21h
    
    lea dx,m4
    mov ah,9
    int 21h
    jmp f
    
    low6: 
    
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    int 21h
    
     mov ah,2
     mov dl,'6'
     int 21h
    
     lea dx,m3
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,p
    add dl,48
    int 21h
    
    lea dx,m4
    mov ah,9
    int 21h
    
    jmp g
    
    low7:
    
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    int 21h
    
     mov ah,2
     mov dl,'7'
     int 21h
    
     lea dx,m3
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,u
    add dl,48
    int 21h
    
    lea dx,m4
    mov ah,9
    int 21h
    
    jmp h
    
    low8:
    
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    int 21h
    
     mov ah,2
     mov dl,'8'
     int 21h
    
     lea dx,m3
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,v
    add dl,48
    int 21h
    
    lea dx,m4
    mov ah,9
    int 21h
    
    jmp i
    
    low9:
    
    mov dl, 10
    mov ah, 2
    int 21h
    mov dl, 13
    int 21h
    
     mov ah,2
     mov dl,'9'
     int 21h
    
     lea dx,m3
    mov ah,9
    int 21h
    
    mov ah,2
    mov dl,t
    add dl,48
    int 21h
    
    lea dx,m4
    mov ah,9
    int 21h
     jmp exit
    
    
     
     main endp