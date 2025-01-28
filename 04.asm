.model small
.stack 100h
.data
.code 
main proc
    mov dl,1 
    mov ah,2
loopp:
    int 21h
    inc dl
    cmp dl,255
    jne loopp
    
    mov ah,4ch
    int 21h
main endp
end main
        