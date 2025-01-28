.model small
.stack 100h
.data
    mains db 'Kefaet is here, how are you?$'
    subs db 'here$'  
    print db 'yes$'
.code
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    lea si,mains
    lea di,subs 
    
    mov dl,0
  outerloop:
    mov cx,4
    repe cmpsb
    jz print_yes 
    inc dl
    lea di,subs  
    add mains,dl
    lea si,mains
    jmp outerloop
    
    mov ah,4ch
    int 21h
    
   print_yes: 
    mov ah,9
    lea dx,print
    int 21h  
        
main endp
end main


