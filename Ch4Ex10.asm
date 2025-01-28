.model small
.stack 100h
.data 
   a db ?             
   newline db 13,10,'$'
.code
main proc 
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h  
    mov a,al
    sub a,30h 
    
    mov ah,9
    lea dx,newline
    int 21h             
    
    mov cl,a
    
    mov ah,2
    mov dl,cl 
    add dl,30h
    int 21h
main endp
end main



