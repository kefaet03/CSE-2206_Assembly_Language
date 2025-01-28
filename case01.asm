.model small
.stack 100h
.data
.code 
main proc     
    mov ax,-3
    
    cmp ax,0
    
    jl negative
    je zero
    jg positive
    
 negative:
    mov bx,-1  
    jmp endcase
 zero:
    mov bx,0
    jmp endcase
 positive:
    mov bx,1           
    jmp endcase
    
 endcase:
    mov ah,2
    mov dx,bx 
    add dx,30h
    int 21h
    
    mov ah,4ch
    int 21h   
    
    
    
main endp
end main