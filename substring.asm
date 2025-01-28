.model small
.stack 100h
.data
   mains db 'Kefaet is here$'
   subs db 'here$'
   msg1 db 'Yes$'
   msg2 db 'No$'
.code 

main proc
    mov ax,@data
    mov ds,ax 
    mov es,ax
    
    mov dl,14
    sub dl,3
    
    CLD
    
    lea si,mains
  Looping:
    push si
    lea di,subs        
    mov cx,4
    REPE cmpsb
    je found
    ;dec di
    ;cmp [di],'$'
    ;je found
    
    pop si
    add si,1
    
    dec dl
    cmp dl,0
    jne Looping
    
    mov ah,9
    lea dx,msg2
    int 21h

    mov ah,4ch
    int 21h 
    
   found:
    mov ah,9
    lea dx,msg1
    int 21h 
    
main endp
end main