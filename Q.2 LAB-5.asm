org 100h
mov ax, 180h      
mov bl, 62h      
xor dx, dx       
div bl            
mov al, al        
call print_number
mov al, ah        
call print_number
mov ah, 4Ch      
int 21h
print_number:
    push ax     
    mov bl, al
    mov ah, al
    and ah, 0F0h  
    shr ah, 4   
    add ah, 30h    
    cmp ah, 39h    
    jle print_first
    add ah, 7     
print_first:
    mov dl, ah     
    mov ah, 02h    
    int 21h
    mov ah, bl
    and ah, 0Fh    
    add ah, 30h    
    cmp ah, 39h    
    jle print_second
    add ah, 7     
print_second:
    mov dl, ah
    mov ah, 02h
    int 21h
    pop ax        
    ret