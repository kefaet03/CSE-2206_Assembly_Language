.model small
.stack 100h
.data
   a db 0
   b db 0
   sum db 0
   newline db 10,13,'$'
.code

input_decimal proc
    mov ax,0
    mov bl,10 
    mov dx,0
    
  input_loop:
    mov ah,1
    int 21h
    
    cmp al,13
    je input_end
    
    sub al,30h
    mov cl,al
    mov ch,0
    mov ax,dx
    
    mul bl
    add ax,cx
    mov dx,ax
    
    jmp input_loop
    
  input_end:
    ret
input_decimal endp

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
    mov ax, @data        
    mov ds, ax 

    ; Input first number (stored in variable 'a')
    call input_decimal
    mov a, dl             ; Store result in variable 'a'
    
    mov ah, 9             ; Print new line
    lea dx, newline
    int 21h
    
    ; Input second number (stored in variable 'b')
    call input_decimal
    mov b, dl             ; Store result in variable 'b'
    
    mov ah, 9             ; Print new line
    lea dx, newline
    int 21h
    
    ; Calculate sum: sum = a + b
    mov al, a             ; Move first number into AL 
    add al, b             ; Add second number
    mov sum, al           ; Store result in sum

    ; Print sum
    mov ax, 0             ; Clear AX
    mov al, sum           ; Move sum into AX
    call print_decimal    ; Call print function to display result
    
    ; Exit program
    mov ah, 4ch
    int 21h
main endp
end main





