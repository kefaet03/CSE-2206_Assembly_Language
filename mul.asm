.model small
.stack 100h
.data
.code
main proc
    mov al,01100101b
    mov ah,0
    mov bl,01010010b
    
    mov dx,0
    mov cx,8
  looping:
    test bl,1
    jz nothing
    
    add dx,ax
    
    nothing:
    shl al,1
    shr bl,1
    loop looping
    
main endp
end main
      



