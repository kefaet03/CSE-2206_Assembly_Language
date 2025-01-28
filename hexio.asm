.model small
.stack 100h
.data
    result_label db 'Result in AX: $'
    newline db 0Dh, 0Ah, '$'   ; Newline for output
    hex_input dw 0             ; Store the input value
    str1 db 5 dup ('$') 
    table db 'ABCDEF'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov dx, 0    

InputLoop:
    mov ah, 1      
    int 21h
    cmp al, 0Dh       
    je endinggg 

    cmp al, '0'
    jl InvalidInput   
    cmp al, '9'
    jbe DigitInput    

    cmp al, 'A'
    jb InvalidInput   
    cmp al, 'F'
    jbe HexInput      

InvalidInput:
    mov ah, 9
    lea dx, newline
    int 21h        
    jmp InputLoop

DigitInput:
    sub al, '0'       
    jmp ProcessHex

HexInput:
    sub al, 'A'      
    add al, 10        

ProcessHex:
    shl dx, 4         
    mov ah,0
    or dx, ax        
    jmp InputLoop
    
    mov ax,4 
    lea bx,table    
endinggg:
    mov ch,dh  
    and ch,11110000b
    mov cl,4
    shr ch,cl
    cmp ch,9
    jg chroutput
    jmp digitoutput
    
    mov ch,dh
    and ch,00001111b
    cmp ch,9
    jg chroutput
    jmp digitoutput
    
    mov ch,dl  
    and ch,11110000b
    mov cl,4
    shr ch,cl
    cmp ch,9
    jg chroutput
    jmp digitoutput
    
    mov ch,dl
    and ch,00001111b
    cmp ch,9
    jg chroutput
    jmp digitoutput
    
  chroutput:
    sub ch,10
    mov al,ch
    XLAT
    mov dl,al
    mov ah,2
    int 21h
    
  digitoutput:
    mov dl,ch
    mov ah,2
    int 21h 
  jmp endinggg    
    
main endp
end main



