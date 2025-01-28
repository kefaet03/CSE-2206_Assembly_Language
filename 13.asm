.model small
.stack 100h
.data  
   array dw 5,4,3,5,6,7,6,5,4,1,3
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,2
    mov dx,array+8 
    int 21h
    mov cx,dx
    
    mov ah,2
    mov dx,array+18   
    int 21h
    mov bx,dx
    
    mov array+8,bx
    mov array+18,cx
    
    mov ah,2
    mov dx,array+8
    mov cx,dx
    int 21h
    
    mov ah,2
    mov dx,array+18
    mov bx,dx
    int 21h
    
main endp
end main

