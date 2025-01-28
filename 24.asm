.model small
.stack 100h
.data
.code
main proc
    mov ax,-2
    cmp ax,0
    jbe next                          
    
    neg ax
    mov ah,2
    mov dx,ax
    add dx,30h
    int 21h
    
next:
   mov ah,4ch
   int 21h    


