.model small
.stack 100h
.data 
     w db 10 dup(?) 
     msg db 10,13,'$'
     sum db 0 
     result db 0
.code    

main proc
    mov ax,@data
    mov ds,ax 
    
    mov dx,0
    
    mov cx,0 
    lea bx,w
    
    mov ah,1
  input_loop: 
    int 21h
    
    sub al,30h 
    mov [bx],al
    add sum,al
    add bx,1
    
    inc cx
    
    cmp cx,10
    jl input_loop   
    
    mov al,sum
    
    mov ah,0
    mov al,sum  
    mov bl,10 
    
    mov dx
   
  output_loop:
    div bl 
    
    mov cl,ah
    mov ch,0 
    push cx  
    inc bl
    
    mov ah,0
    
    cmp ax,0
    jnz output_loop
     
    mov ah,2 
  printing_loop:
    dec 
    pop dx 
     
    
    mov ah,4ch
    int 21h  
    
    
    
    
main endp
end main

