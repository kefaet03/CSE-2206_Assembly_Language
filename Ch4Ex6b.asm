.model small
.stack 100h
.data
   a dw 7
.code
main proc   
   mov ax,@data
   mov ds,ax
    
   mov ax,a
   add ax,1
   neg ax
   mov a,ax 
main endp
end main
