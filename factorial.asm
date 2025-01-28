.model small
.stack 100h
.data  
   a dw 5  
   result dw 1
.code
main proc      
    mov ax,@data
    mov ds,ax
                
    mov cx,a 
    mov ax,cx
    
 factorial:
    mov dx,ax
    sub cx,1
    
    mov ax,dx
    mul cx
    
    cmp cx,1
    jne factorial   

    mov ah,4ch
    int 21h 
main endp
end main
