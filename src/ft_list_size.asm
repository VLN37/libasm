%include "syscalls_x64.asm"

section .text
    global ft_list_size

ft_list_size:
    mov rax, 0

iterate:
    cmp qword rdi, NULL
    jz exit
    inc rax
    mov rdi, [rdi + 8]
    jmp iterate

exit:
    ret
