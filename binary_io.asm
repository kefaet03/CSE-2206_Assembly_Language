.model small
.stack 100h
.data
.code
main proc  
    mov dl,0
  looping: 
    mov ah,1
    int 21h
    cmp al,13
    je end_looping
    
    sub al,30h
    shl dl,1
    or dl,al
    jmp looping
  end_looping:
  
main endp
end main




