.model small
.stack 100h
.data
   msg1 db 'Type a line of text: $'
   first db 64
   last db 91
   newline db 10,13,'$' 
   msg2 db 'No capital letters: $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    lea dx,newline
    int 21h
    
    mov ah,1
  input_loop:
    int 21h 
    
    cmp al,13
    je end_input_loop:
    
    cmp al,65
    jl outlier
    cmp al,90
    jg outlier
    
    cmp al,first
    jng think_last
    mov first,al
  
  think_last:  
    cmp al,last
    jl set_last
    
    jmp outlier
    
   set_last:
    mov last,al 
   outlier:
    jmp input_loop       

   end_input_loop:
    
    mov ah,9
    lea dx,newline
    int 21h
    
    cmp first,64
    jne there_is
    cmp last,91
    jne there_is
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov ah,4ch
    int 21h
    
   there_is:
    mov ah,2
    mov dl,last
    int 21h
    
    mov ah,9
    lea dx,newline
    int 21h
    
    mov ah,2
    mov dl,first
    int 21h
    
main endp
end main
    