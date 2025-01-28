.model small
.stack 100h
.data 
     array db 5 dup('0'),'$' 
     newline db 10,13,'$'
     sumo db 0
     sume db 0 
     result db 0
.code 

input_decimal proc
    mov ax,0
    mov bx,10 
    mov dl,0
    
  input_loop1:
    mov ah,1
    int 21h
    
    cmp al,32
    je input_end
    
    sub al,30h
    mov cl,al
    mov ch,0
    mov al,dl
    
    mul bx
    add al,cl
    mov dl,al
    
    jmp input_loop1
    
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
    mov ax,@data
    mov ds,ax 
     
    mov si,offset array
    
  input_loop:
    call input_decimal 
    mov [si],dl
    
    mov al,dl
    mov dh,al 
    mov [si],al
    
    mov ah,0
    mov dl,2
    div dl
    
    cmp ah,0
    je even
    add sumo,dh
    jmp ending
   even: 
    add sume,dh
    
   ending: 
    add si,1
    
    ;mov ah,9
    ;lea dx, newline
    ;int 21h
    
    cmp [si],'$'
    jne input_loop 
    
    
    
    mov ah,9
    lea dx, newline
    int 21h   
    
    mov al,sume
    mov ah,0
    call print_decimal
    
    mov ah,9
    lea dx, newline
    int 21h
    
    mov al,sumo
    mov ah,0
    call print_decimal 
    
    mov ah,4ch
    int 21h  
main endp
end main











