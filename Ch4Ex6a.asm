.model small
.stack 100h
.data
   a dw 7
   b dw 9
.code
main proc   
   mov ax,@data
   mov ds,ax
    
   mov ax,b
   sub ax,a
   mov a,ax 
main endp
end main
           
       
       
       
       
       
       
       
       
       
       
       
       