.model small
.stack 100h
.data
.code
main proc
    call fun1 
    call fun2    
    mov ah,2
    mov dl,'M'
    int 21h

    mov ah,4ch
    int 21h

main endp 

fun1 proc     
    call fun3 
    call fun4
    mov ah,2
    mov dl,'A'
    int 21h 
    ret
fun1 endp   

fun2 proc 
    call fun5 
    call fun6
    mov ah,2
    mov dl,'B'
    int 21h
    ret
fun2 endp

fun3 proc
    mov ah,2
    mov dl,'C'
    int 21h
    ret
fun3 endp

fun4 proc
    mov ah,2
    mov dl,'D'
    int 21h
    ret
fun4 endp


fun5 proc 
    call fun7
    mov ah,2
    mov dl,'E'
    int 21h
    ret
fun5 endp

fun6 proc
    call fun8
    mov ah,2
    mov dl,'F'
    int 21h
    ret
fun6 endp  

fun7 proc
    mov ah,2
    mov dl,'G'
    int 21h
    ret
fun7 endp

fun8 proc
    mov ah,2
    mov dl,'H'
    int 21h
    ret
fun8 endp
end main

