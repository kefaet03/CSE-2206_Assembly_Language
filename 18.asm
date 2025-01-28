.model small
.stack 100h
.data 
  string1 db 100 dup('a')
  newline db 10,13,'$'
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov si,offset string1
    mov ah,1
  input_loop:
    int 21h 
    
    cmp al,13
    je end_input_loop
    
    cmp al,97
    jl no_problem
    cmp al,122
    jg no_problem
    
    sub al,20h
    mov [si],al
   no_problem:
    mov [si],al
    inc si
    jmp input_loop
  end_input_loop:.
    mov [si],'$' 
    
    mov ah,9
    lea dx,newline
    int 21h
      
    mov ah,9
    lea dx,string1
    int 21h
    
main endp
end main
    




