.model small
.stack 100h
.data 
     array db 4 dup(?) 
     newline db 10,13,'$'
     sumo db 0
     sume db 0 
     result db 0
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
    
    mov cx,0 
    lea bx,array
    
  input_loop:
    mov ah,1 
    int 21h
    
    sub al,30h
    mov dh,al 
    mov [bx],al
    
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
    add bx,1
    
    inc cx
    
    cmp cx,4
    jl input_loop
    
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






