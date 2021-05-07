

org 100h

.model small
.data 

x db 0
y db 0
z db 0
tmp db 0
msg1 db "Maximum : $"
msg2 db "Enter 1st number : $"
msg3 db "Enter 2nd number : $"
msg4 db "Enter 3rd number : $"
 



.code

mov ax,@data
mov ds,ax

lea dx,msg2
mov ah,9
int 21h

mov ah,1      
int 21h
sub al,48     
mov x,al


mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h       

    
    lea dx,msg3
mov ah,9
int 21h

mov ah,1      
int 21h
sub al,48     
mov y,al

mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h  

lea dx,msg4
mov ah,9
int 21h 



mov ah,1      
int 21h
sub al,48     
mov z,al

mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h  

mov al,x          

cmp al,y           
jge greater        
mov al,y           
jmp greater       


greater:            
cmp al,z          
jge greatest       
mov al,z           
jmp greatest        


greatest:
mov tmp,al        

mov ah,2           
mov dl,10
int 21h

mov ah,2           
mov dl,13
int 21h


mov ah,9           ; print message 1
lea dx,msg1
int 21h

mov ah,2           ; print the greatest number
mov dl,tmp
add dl,48
int 21h













ret




