.model small
.stack 100h
.data
   a db ?
.code
main proc
    mov ah,1
    int 21h
    
    cmp al,65
    jle end_programme
    cmp al,90
    jg end_programme
    
    mov ah,2
    mov dl,al
    int 21h
    
 end_programme:
main endp
end main




