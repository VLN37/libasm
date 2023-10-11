%include "syscalls_x64.asm"

section .text
    global ft_strcpy

ft_strcpy:
                        ; first pointer is already in Destination Index (RDI)
                        ; second pointer is already in Source Index (RSI)
    mov rax, rdi        ; return value is always the original value of DI

iterate:
    cmp byte [rsi], 0
    je exit
    mov cl, [rsi]
    mov [rdi], cl
    inc rsi
    inc rdi
    jmp iterate

exit:
    mov byte [rdi], 0
    ret
