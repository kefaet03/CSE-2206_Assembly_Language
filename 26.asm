.model small
.stack 100h
.data
   fibo db 0,1,100 dup ('&')   
   n db 20
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
   
   lea si,fibo
   lea di,fibo+1 
   
   mov cl,n
   
  L:
   mov al,[si]
   mov bl,[di]
   
   add al,bl
   
   inc di
   mov[di],al
   
   inc si
   inc di
   
   dec cl
   cmp cl,0
   jne L
   
   lea si,fibo      
  Output:
   mov al,[si] 
   mov ah,0
   call print_decimal 
   
   mov ah,2
   mov dl,32
   int 21h
   
   inc si
   cmp [si],'$'
   jne Output

main endp
end main

