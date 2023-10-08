%include "syscalls_x64.asm"

extern __errno_location

section .text
    global ft_read

ft_read:
    mov rax, __READ
    syscall
    ret
