%include "syscalls_x64.asm"

section .text
    global ft_list_add_front

ft_list_add_front:
    mov rdx, [rdi]
    mov [rsi + 8], rdx  ; new->next = *begin
    mov [rdi], rsi      ; *begin = new
