.model small
.stack 100h
.data
     string1 dw 's','t','r','i','n','g','1','$','$'
     strign2 dw 10 dup('$')
.code
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    lea si,string1+12
    lea di,string1+14
    
    STD    
    
   Looping:      
    movsw
    cmp [si],'t'
    jne Looping
    
    add si,2
    mov word ptr [si],'r'
    
    mov ah,9
    lea dx,string1
    int 21h
    
main endp
end main



