.model small
.stack 100h
.data 
    marks db 5, 6, 7, 8,   
          db 4, 5, 6, 7,      
          db 8, 3, 5, 4       
    num_students db 3         
    num_subjects db 4        
    newline db 13, 10, '$'   
    avg db 3 dup ('0'),'$' 
    sum db 0
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov di,offset avg
    mov si,offset marks
    mov cl,0
  row_loop:
   mov sum,0 
   mov ch,0
   col_loop: 
    mov al,sum   
    add al,[si]
    mov sum,al
    
    inc si
    inc ch
    
    cmp ch,4
    jne col_loop
    
    mov ah,0
    mov bl,4
    div bl
    
    mov [di],al
    inc di
    
    inc cl
    cmp cl,3
    jne row_loop
    
    mov ah,9
    lea dx,avg
    int 21h

main endp
end main

