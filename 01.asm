.model small
.stack 100h
.data  
   a db 0
   b db 0  
   sum db 0
   newline db 10,13,"$"
.code
main proc
    mov ax,@data
    mov ds,ax 
       
  input_a:
    mov ah,1
    int 21h
    
    cmp al,13
    je end_a 
    
    sub al,30h
    
    mov dl,al
    mov al,a
    mov bl,10
    mul bl
    add al,dl
    
    mov a,al
    
    jmp input_a 
    
  end_a:      
    mov ah,9
    lea dx,newline
    int 21h 
    
  input_b:
    mov ah,1
    int 21h
    
    cmp al,13
    je end_b 
    
    sub al,30h
    
    mov dl,al
    mov al,b
    mov bl,10
    mul bl
    add al,dl
    
    mov b,al   
    
    jmp input_b
    
  end_b:
    mov ah,9
    lea dx,newline
    int 21h
        
    mov al,a
    mov bl,b 
    add al,bl
    mov sum,al 
    
    mov cx,0
  stack_loop:
    mov al,sum
    mov ah,0
    
    mov bl,10
    div bl
    
    mov dl,ah
    mov dh, 0
    push dx  
    
    inc cx
    
    mov sum,al
    
    cmp sum,0
    jne stack_loop
    
    mov ah,2
  pop_loop:
    pop dx
    add dl,30h
    int 21h 
    
    dec cx
    cmp cx,0
    jne pop_loop
  

    mov ah,4ch
    int 21h
main endp
end main