# libasm

Some notes i aggregated while studying

## Registers, what is each used for

### Parameters
In order, 1st to 6th parameter.

rdi, rsi, rdx, rcx, r8, r9

subsequent ones stored on the LIFO stack

### Data Registers

RAX, RBX, RCX, RDX

- AX - ACCUMULATOR register, return values
- BX - BASE register
- CX - COUNT register, stores loop counts
- DX - DATA register

### Pointer Registers

RIP, RSP, RBP

- IP - INSTRUCTION pointer, you cannot access this
- SP - STACK pointer
- BP - BASE pointer

### Index Registers

RSI, RDI

- SI - SOURCE index, used in string index operations
- DI - DESTINATION index, used in string index operations

## Caller vs Callee

All caller registers must b saved in a safe place before calling a function


| register | byte 0-3  | bytes 0-1 | byte 0 | who saves       |
| :------: | :-------: | :-------: | :----: | :-------------: |
| quadword | doubleword| word      | byte   | -               |
| %rax     | %eax      | %ax       | %al    | Caller          |
| %rbx     | %ecx      | %bx       | %bl    | Called Function |
| %rdi     | %edi      | %di       | %dil   | Caller (arg1)   |
| %rsi     | %esi      | %si       | %sil   | Caller (arg2)   |
| %rdx     | %edx      | %dx       | %dl    | Caller (arg3)   |
| %rcx     | %ecx      | %cx       | %cl    | Caller (arg4)   |
| %rsp     | %esp      | %sp       | %spl   | Stack ptr ?     |
| %rbp     | %ebp      | %bp       | %bpl   | Called Function |
| %r8      | %r8d      | %r8w      | r8b    | Caller (arg5)   |
| %r9      | %r9d      | %r9w      | r9b    | Caller (arg6)   |
| %r10     | %r10d     | %r10w     | r10b   | Caller          |
| %r11     | %r11d     | %r11w     | r11b   | Caller          |
| %r12     | %r12d     | %r12w     | r12b   | Called Function |
| %r13     | %r13d     | %r13w     | r13b   | Called Function |
| %r14     | %r14d     | %r14w     | r14b   | Called Function |
| %r15     | %r15d     | %r15w     | r15b   | Called Function |

## Debugging tips

- gdb a.out
- tui enable
- break (func, asm label, symbols)
- layout regs or 'i r general' or 'disp /s $eax'
- run
