.model small
.stack 100h
.data


.code
main proc
    
    mov ah,2
    mov dl,45
    int 21h
    
    call temp
    
    mov ah,2
    mov dl,45
    int 21h    
    
    mov ah,4ch
    int 21h
    main endp   

temp proc
    mov ah,2
    mov dl,49
    int 21h   
    
    call tempoo
    
    ret 
    temp endp      

tempoo proc
    mov ah,2
    mov dl,46
    int 21h
       
    ret 
    tempoo endp
end main


