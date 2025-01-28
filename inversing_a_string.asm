.model small
.stack 100h
.data        
   count dw 1
.code 
main proc
   mov ax,@data
   mov ds,ax
   
   mov cx,count
   
   mov ah,1
 input_loop:
   int 21h
   
   cmp al,13
   je  end_input  
   
   push ax 
   inc cx
   jmp input_loop
   
   
 end_input: 
   
   dec cx
   mov ah,2
 output_loop: 
   pop dx
   int 21h
   
   dec cx
   cmp cx,0
   je end_output
   
   jmp output_loop
   
 end_output:
   mov ah,4ch
   int 21h
   
main endp
end main
   
   
       