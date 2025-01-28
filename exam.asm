.model small
.stack 100h
.data 
     num1 dw 0AC10h
     num2 dw 0120h 
     str1 db 'ACD$'
     str2 db 'ABC$'
     st_arr dw 4 dup ('0')
.code
main proc
     mov ax,@data
     mov ds,ax
     
     mov ax,[num1]
     push ax
     mov ax,[num2]
     push ax
     pop bx
     pop ax
     add ax,bx
     
main endp
end main




