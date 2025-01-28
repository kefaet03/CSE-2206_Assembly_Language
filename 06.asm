.model small
.stack 100h
.data
.code
main proc
    mov cx,0
    

 lllooop:
    cmp cx,9
    jge end_first_sub   
    cmp cx,2
    jle end_first_sub
    jmp y_print
  end_first_sub:
    mov ax,cx
    mov bl,3
    div bl
    cmp ah,0
    je y_print
    
    mov ah,2
    mov dl,'N'
    int 21h
    
    jmp end_lllooop
  y_print:
    mov ah,2
    mov dl,'Y'
    int 21h  

 end_lllooop:
    inc cx
    cmp cx,11
    jne lllooop
    
    mov ah,4ch
    int 21h
    
main endp
end main
    
