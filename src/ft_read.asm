%include "syscalls_x64.asm"

extern __errno_location

section .text
    global ft_read

ft_read:
restore_errno:
    ; with relation to procedure linkage table
    call __errno_location wrt ..plt
    mov r12, rax
    mov dword [r12], 0

read:
    mov rax, __READ
    syscall
    test rax, rax
    js set_errno
    ret

set_errno:
    mov dword [r12], eax
    neg dword [r12]
    mov rax, [r12]
    ret
