.model small
.stack 100h
.data
    newline db 10,13,'$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov cx,0
  input_loop: 
    mov ah,1
    int 21h
    
    cmp al,13
    je end_input_loop
     
    mov ah,0
    push ax 
    inc cx
    jmp input_loop
    
  end_input_loop:
    mov ah,9
    lea dx,newline
    int 21h
    
      
    mov ah,2
  output_loop:
    pop dx
    int 21h
    
    Loop output_loop
    
main endp
end main
       
    
      




