.model small
.stack 100h
.data
.code
main proc
    mov ah,1
    int 21h
    cmp al,'A'
    jl endd
    cmp al,'Z'
    jg endd
    
    mov ah,2
    mov dl,al
    int 21h
    
    
  endd: 
    mov ah,4ch
    int 21h
    
main endp
end main