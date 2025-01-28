.model small
.stack 100h
.data
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ax,-5
    cmp ax,0
    jl negative
    jz zero
    
    mov bx,1
    jmp ending
    
  negative:
    mov bx,-1  
    jmp ending

  zero:
    mov bx,0

  ending:
main endp
end main
