.model small
.stack 100h
.data
.code

main proc
    
    mov ah,1  
    int 21h 
    sub al,48
    
    
    mov cl,al ;n   
    
    mov dl,10
    mov ah,2
    int 21h
    
    mov dl,13
    mov ah,2
    int 21h
    
    mov bl,1  ;i
    
outer_top: 
 cmp bl,cl
 jg exit 
 
 mov dh,cl
 sub dh,bl ;j
 
 
 space:
  cmp dh,1
  jl starA
  
  mov dl,' '
  mov ah,2
  int 21h 
  dec dh
  jmp space 
  
  starA:
 
  mov bh,bl
  add bh,bh
  sub bh,1 
  mov ch,1
  
  printAll: 
  cmp ch,bh
  jg newline
                                                                                                  
                                                                                                  
  cmp ch,1
  je star
  cmp ch,3
  je star
  cmp ch,5
  je star
  cmp ch,7
  je star
  cmp ch,9
  je star
  
  cmp ch,0
    je A 
    cmp ch,2
    je A
    cmp ch,4
    je A
    cmp ch,6
    je A
    cmp ch,8
    je A
    
  
  star:
  mov dl,'*'
  mov ah,2
  int 21h  
  
  inc ch
  jmp printAll
  
  A:
  mov dl,'A'
  mov ah,2
  int 21h 
  
  inc ch
  jmp printAll
  
  newline:
  
  mov dl,10
  mov ah,2
  int 21h
  
  mov dl,13
  mov ah,2
  int 21h 
  
  inc bl
  
  jmp outer_top
  
  exit:
 mov ah,4ch
 int 21h
  
  
 
 
 
 
 
 
 
 
 
    
    
    
    
 