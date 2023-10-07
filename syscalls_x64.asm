%ifndef __SYSCALLS_X64__
%define __SYSCALLS_X64__ 0

%define __READ 0
%define __WRITE 1
%define __OPEN 2
%define __CLOSE 3
%define __STAT 4
%define __LSEEK 8
%define __ACCESS 21
%define __DUP 32
%define __DUP2 33
%define __EXECVE 59
%define __EXIT 60

%define __STDIN 0
%define __STDOUT 1
%define __STDERR 2

%define EXIT_SUCCESS 0
%define EXIT_FAILURE 1
%define NULL 0x0

%endif
