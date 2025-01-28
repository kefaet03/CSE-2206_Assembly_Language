.model small
.stack 100h
.data
.code
main proc
    mov dx,0000h
    mov ax,0005h
    mov bl,02h
    
    div bl

main endp
end main







