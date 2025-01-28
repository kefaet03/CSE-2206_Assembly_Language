.model small
.stack 100h
.data   
    array db 'K','e','f','a','e','t','$'     
    newline db 10,13,'$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,array
    int 21h
    
    lea si,array
    mov cl,6
    sar cl,1
    mov bl,5
    mov bh,0
   Looping:
    mov al,[si]
    add si,bx
    xchg [si],al
    sub si,bx
    mov [si],al
    inc si
    sub bx,2
    dec cl
    cmp cl,0
    jne Looping 
    
    mov ah,9
    lea dx,newline
    int 21h
    
    mov ah,9
    lea dx,array
    int 21h  
    
main endp
end main


