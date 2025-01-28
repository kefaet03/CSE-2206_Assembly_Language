.model small
.stack 100h
.data
   a db 5
   b db 2
.code
main proc  
    mov ax,@data
    mov ds,ax
    
    mov al,a
    mov bl,5
    mul bl
    mov bl,al
    
    mov al,b
    mov cl,12
    mul cl
    mov cl,al
    
    sub bl,cl
    mov a,bl
    
main endp
end main
    


