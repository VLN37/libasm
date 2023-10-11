%include "syscalls_x64.asm"

extern __errno_location

section .text
    global ft_write

ft_write:
restore_errno:
    ; with relation to procedure linkage table
    call __errno_location wrt ..plt
    mov r12, rax
    mov dword [r12], 0

write_label:
    mov rax, __WRITE
    syscall
    test rax, rax
    js set_errno
    ret

set_errno:
    mov dword [r12], eax
    neg dword [r12]
    mov rax, -1
    ret
