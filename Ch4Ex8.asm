
.model small
.stack 100h
.data
   a db "?$"
   b db ?
   c db ?  
   d db "The sum of $"
   e db " and $"
   f db " is $"
   newline db 10,13,'$'
.code              
main proc   
   mov ax,@data
   mov ds,ax
    
   mov ah,9
   lea dx,a
   int 21h  
   
   mov ah,1
   int 21h
   mov b,al
   
   mov ah,1
   int 21h
   mov c,al
   
   mov ah,9
   lea dx,newline
   int 21h 
   
   mov ah,9
   lea dx,d
   int 21h 
   
   mov ah,2
   mov dl,b
   int 21h
   
   mov ah,9 
   lea dx,e
   int 21h
   
   mov ah,2
   mov dl,c
   int 21h
   
   mov ah,9
   lea dx,f
   int 21h
   
   mov ah,2
   mov dl,b
   add dl,c
   sub dl,30h
   int 21h
main endp
end main

