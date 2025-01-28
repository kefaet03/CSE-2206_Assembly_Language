.model small
.stack 100h
.data 
   msg1 db 'Enter A HEX Digit: $'
   msg2 db 'In Decimal It Is: $'
   newline db 10,13,'$'
   digit db ?
.code
main proc 
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    sub al,'A'
    mov digit,al
    
    mov ah,9 
    lea dx,newline
    int 21h
    
    lea dx,msg2
    int 21h
    
    mov ah,2
    mov dl,'1'
    int 21h
    
    mov al,digit
    mov ah,0
    mov bl,10
    div bl
    
    mov dl,ah          
    add dl,30h
    mov ah,2
    int 21h
main endp
end main



