.model small
.stack 100h
.data
   array db 10,20,30,50,60,70,80,90,100,'$'
   size db 9
   
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
                      
    mov si,offset array
    add si,3 
    
    mov di,offset array
    add di,9

  shifting:
    mov bx,di
    add bx,1
    
    mov al, [di]    
    mov [bx], al   
    
    cmp di,si
    je ending
    
    dec di
    jmp shifting
   
  ending:
    mov [si],40
    
    mov si,offset array
  Display:    
    mov ah,0
    mov al,[si]
    
    call print_decimal
    
    inc si
    
    cmp [si],'$'
    jne Display
    
    
main endp
end main
     
    
       




