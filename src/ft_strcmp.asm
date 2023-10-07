%include "syscalls_x64.asm"

section .text
    global ft_strcmp

ft_strcmp:
byte_cmp:
    movsx eax, byte [rdi]

    cmp byte [rsi], al
    jne exit
    cmp byte [rsi], 0
    je exit
    cmp byte [rdi], 0
    je exit

    inc rsi
    inc rdi
    jmp byte_cmp

exit:
    movsx edi, byte [rsi]
    sub eax, edi
    ret
