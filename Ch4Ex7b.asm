.model small
.stack 100h
.data
   a db ?
.code
main proc   
   mov ax,@data
   mov ds,ax
    
   mov ah,1
   int 21h
   
   add al,20h
   
   mov ah,2
   mov dl,al
   int 21h
main endp
end main



