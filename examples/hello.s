; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit Linux only.
; To assemble and run:
;
;     nasm -felf64 hello.asm && ld hello.o && ./a.out
; ----------------------------------------------------------------------------------------

%include "syscalls_x64.asm"

section   .text
    global    hello_world


hello_world:
    mov       rax, __WRITE            ; system call for write
    mov       rdi, __STDOUT           ; file handle 1 is stdout
    mov       rsi, message            ; address of string to output
    mov       rdx, 13                 ; number of bytes
    syscall                           ; invoke operating system to do the write
    mov       rax, EXIT_SUCCESS       ; signify success / same as doing nothing
    ret

section   .data
message:
    db        "Hello, World", 10      ; note the newline at the end
