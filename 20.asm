.model small
.stack 100h
.data
    array db 50, 20, 60, 14, 40, 30  
    size dw 6                       
    newline db 10,13,'$'       
.code

display proc
    mov si, offset array           
    mov cx, size                

display_loop:
    mov dl, [si]                  
    mov ah, 2                      
    int 21h                        

    mov dl, ' '                  
    int 21h

    inc si                       
    loop display_loop             

    mov ah, 9                   
    lea dx, newline
    int 21h

    ret
display endp


selection_sort proc
    mov cx, size                   
    dec cx                         
    mov si, offset array            

outer_loop:
    mov di, si                     
    mov bx, si                  

    mov ax, [si]                

inner_loop:
    add bx, 1                      
    cmp bx, offset array + size     
    jae found_min                

    mov al, [bx]                 
    cmp al, [di]                  
    jge inner_loop_continue   

    mov di, bx                      

inner_loop_continue:
    jmp inner_loop

found_min:
    cmp si, di                     
    je skip_swap                

    mov al, [si]                 
    mov ah, [di]                 
    mov [si], ah            
    mov [di], al            

skip_swap:
    inc si                       
    dec cx                     
    jnz outer_loop     

    ret
selection_sort endp

main proc
    mov ax, @data                 
    mov ds, ax
    
    ;call display

    call selection_sort

    call display

    mov ah, 4Ch        
    int 21h
main endp
end main





