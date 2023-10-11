%include "syscalls_x64.asm"

section .text
    global ft_strlen

ft_strlen:
    mov rax, rdi         ; str pointer moved for calculation


increment:
    cmp byte [rax], 0
    je exit
    inc rax
    jne increment

exit:
    sub rax, rdi
    ret
