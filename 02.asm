.model small
.stack 100h
.data
  box db 5 dup('***********',10,13),'$'
  middle db 4 dup ('*'),'$' 
  a db ?
  b db ?     
  c db ? 
  newline db 10,13,'$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,2
    mov dl,'?'
    int 21h
    
    mov ah,1
    int 21h
    mov a,al
    
    mov ah,1
    int 21h
    mov b,al
    
    mov ah,1
    int 21h
    mov c,al 
    
    mov ah,9 
    lea dx,newline
    int 21h
    
    lea dx,box
    int 21h
    
    lea dx,middle
    int 21h
    
    mov ah,2
    mov dl,a
    int 21h
    
    mov ah,2
    mov dl,b
    int 21h
    
    mov ah,2
    mov dl,c
    int 21h  
    
    mov ah,9 
    lea dx,middle
    int 21h
    
    lea dx,newline
    int 21h
    
    mov ah,9
    lea dx,box
    int 21h
    
    mov ah,2
    mov dl,7h
    int 21h
main endp
end main
  


