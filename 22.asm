.model small
.stack 100h
.data
   str1 db 'Heyya World!! Can you see the humeniterian condition in GAZA???? Or you are blind. $'
   str2 db 'GAZA$'
   msg1 db 'Yes$'
   msg2 db 'No$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov si,offset str1
    mov di,offset str2
    
    mov bl,-1
    mov ch,0
    
    
  search_loop:
    mov ah,[si]
    
    cmp ah,'$'
    je not_found
    
    cmp ah,[di]
    je something 
    
    mov di,offset str2
    mov bl,-1 
    inc ch
    inc si
    jmp search_loop
    
   something:
    mov bl,ch 
    inc si
    inc di 
    cmp [di],'$'
    jne search_loop 
    
    mov ah,9
    lea dx,msg1
    int 21h
    
  end_search_loop:
    mov ah,4ch
    int 21h

  not_found:
    mov ah,9
    lea dx,msg2
    int 21h 
    
main endp
end main


