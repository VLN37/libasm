%include "syscalls_x64.asm"

extern __errno_location

section .text
    global ft_write

ft_write:
    mov rax, __WRITE
    syscall
    ret
