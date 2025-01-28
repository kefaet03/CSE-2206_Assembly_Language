.model small
.stack 100h
.data
.code
main proc
    mov cx,0
    mov ah,2
    
 top:
    mov dl,'*'
    int 21h
    
    inc cx
    cmp cx,10
    jl top
    
    mov ah,4ch
    int 21h
    
main endp
end main