.model small
.stack 100h
.data
.code
main proc
    mov ax,3
    mov bx,1
    cmp ax,bx 
    jb next
    mov cx,ax
    
    mov ah,2
    mov dx,cx
    add dx,30h       ; add 30h for converting ASCII to digit
    int 21h
    
    mov ah,4ch
    int 21h
    
next:
    mov cx,bx    
    
    mov ah,2
    mov dx,cx
    add dx,30h       ; add 30h for converting ASCII to digit
    int 21h
    
main endp
end main
    


