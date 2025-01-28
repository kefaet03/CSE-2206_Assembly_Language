.model small
.stack 100h
.data
   num db ?
   msg1 db 'Even $'
   msg2 db 'Odd $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov num,al
    
    mov ah,0
    mov bl,2 
    div bl
    cmp ah,0 
    jne odd
    
    mov ah,9
    lea dx,msg1
    int 21h
    jmp overpass_odd
    
  odd:
    mov ah,9
    lea dx,msg2
    int 21h  
    

 overpass_odd:
 
main endp
end main

