.model small
.stack 100h
.data  
    msg db 'Yes$'
.code
main proc 
    mov ax,@data
    mov ds,ax 
    
    mov ax,7FFFh
    mov bx,8000h
    
    cmp ax,bx
    jg print      ;use ja (jump above) here to see what actually happens
    
    mov ah,4ch
    int 21h
    
    
   print:
    mov ah,9
    lea dx,msg
    int 21h 
    
    
main endp
end main


