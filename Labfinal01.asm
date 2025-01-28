.model small
.stack 100h
.data  
   a dw 8  
   result dw 1
.code
print_decimal proc
    mov cx,0
    mov bx,10
    
  output_loop:
    mov dx,0
    div bx
    
    push dx
    inc cx
    
    cmp ax,0
    jne output_loop
    
  print_digits:
    pop dx
    add dl,30h
    mov ah,2
    int 21h
    
    dec cx
    cmp cx,0
    jne print_digits
    
    ret 
print_decimal endp
main proc      
    mov ax,@data
    mov ds,ax
                
    mov cx,a
    
 factorial:
    mov ax,result
    mul cx
    
    mov result,ax
    dec cx
    
    cmp cx,1
    jne factorial
    
    mov ax,result
    call print_decimal   

    mov ah,4ch
    int 21h 
main endp
end main 











































