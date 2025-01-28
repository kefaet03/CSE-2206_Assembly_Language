.model small
.stack 100h
.data
   a dw 13904   ;3650h
   b dw 9847    ;2677h 
   newline db 10,13,'$'
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
    
    mov ax,a
    call print_decimal 
    
    mov ah,9
    lea dx,newline
    int 21h
    
    mov ax,b
    call print_decimal
    
    mov ah,9
    lea dx,newline
    int 21h
    
    mov ax,a
    mov bx,b
    xchg ax,bx
    
    mov a,ax
    mov b,bx 
    
    ;xchg a,b
    
    mov ax,a
    call print_decimal 
    
    mov ah,9
    lea dx,newline
    int 21h
    
    mov ax,b
    call print_decimal
    
main endp
end main



