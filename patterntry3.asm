.model small
.stack 1024h
.code
start:
    mov cx, 5
first:
    mov bl, 2ah
    mov bh, 1
    call    drawall
    loop    first
    mov dx, 5
second:
    mov bl, 20h
    mov bh, 0
    mov cx, dx
    call    drawall
    mov cx, 6
    sub cx, dx
    mov bl, 2ah
    mov bh, 1
    call    drawall
    dec dx
    jnz second
    mov ax, 4c00h
    int 21h
drawall:
    push    ax
    push    bx
    push    cx
    push    dx
drawone:
    mov     ah,2h
    mov     dl,bl
    int     21h
    loop    drawone
    or  bh, bh
    jz  retorn
    mov     dl,0Ah
    int     21h
    mov dl,0Dh
    int 21h
retorn:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
    end start