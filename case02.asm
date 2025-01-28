.model small
.stack 100h
.data
.code
main proc
    mov al,3
    
    
    cmp al,1
    je odd
    cmp al,3
    je odd
    cmp al,2
    je even
    cmp al,4
    je even
    
 even:
    mov dl,'e'
    jmp endcase
 odd:    
    mov dl,'o'
    jmp endcase
               
               
 endcase:
    mov ah,2 
    int 21h
    
    mov ah,4ch
    int 21h   
main endp
end main