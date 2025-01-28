.model small
.stack 100h
.data
.code
main proc
    mov ah,1
    int 21h
    
    cmp al,'y'
    je display
    
    cmp al,'Y'
    je display  
    
    mov ah,4ch
    int 21h
    
  display: 
    mov ah,2
    mov dl,al
    int 21h          
    
main endp
end main