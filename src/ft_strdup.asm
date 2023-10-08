%include "syscalls_x64.asm"

extern __errno_location
extern malloc
extern ft_strlen
extern ft_strcpy

section .text
    global ft_strdup

ft_strdup:
restore_errno:
    ; with relation to procedure linkage table
    call __errno_location wrt ..plt
    mov r12, rax
    mov dword [r12], 0

dup:
    call ft_strlen

    mov r13, rdi        ; save string pointer
    mov rdi, rax        ; prepare len for malloc
    inc rdi

    call malloc wrt ..plt
    test rax, rax
    js set_errno

    mov rdi, rax
    mov rsi, r13
    call ft_strcpy      ; dst pointer already in rax
    ret

set_errno:
    mov dword [r12], eax
    neg dword [r12]
    mov rax, -1
    ret
