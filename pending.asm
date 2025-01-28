.model small
.stack 100h
.data
    msg1 db 'Enter a string of Capital Letters: $'
    msg2 db 'Longest Count: $'
    count db ?
.code
main proc
    mov ax,@data
    mov ds,ax
            
    mov ch,0          
    mov dl,1         
    mov ah,1
 input_loop:
    int 21h
    
    cmp al,13
    je end_input
    
    mov cl,al
    sub cl,dl 
    mov dl,al
    cmp cl,1
    je increment 
  next_line:
    jmp input_loop  
    
  increment:
    inc ch
    jmp next_line   

 end_input:
    mov ah,4ch
    int 21h
    
main endp
end main







