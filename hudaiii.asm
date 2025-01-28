.model small
.stack 100h
.data
    str1 db '12345$'
    str2 db '67890$'
.code
main proc
    mov ax, @data
    mov ds, ax 
    
    mov ax,0  
    
    mov cl,2
    
    mov al,10000001b
    sar al,1
main endp
end main





