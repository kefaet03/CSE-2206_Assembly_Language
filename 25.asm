.model small
.stack 100h
.data
   string1 db 'aBCa$'
   string2 db 100 dup('$')
   msg1 db 'YES$'
   msg2 db 'NO$'
   newline db 10,13,'$'
.code
main proc
    mov ax,@data
    mov ds,ax            
    
    lea si,string1
    add si,3
    
    lea di,string2 
    
    mov cl,0  

  L:
    mov al,[si]
    mov [di],al 
    inc di
    dec si
    inc cl
    cmp cl,4
    jne L   
    
    mov ah,9
    lea dx,string2
    int 21h 
    
    lea dx,newline
    int 21h
    
    lea si,string1
    lea di,string2
    
    mov cl,0
  check:
    mov al,[si]
    cmp [di],al
    jne end_check
    
    inc si
    inc di 
    
    inc cl
    cmp cl,4
    jne check
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,4ch
    int 21h    
    
   end_check: 
    mov ah,9
    lea dx,msg2
    int 21h 
main endp
end main
    
    
    