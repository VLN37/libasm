nasm -felf64 hello.asm
gcc -Wall -Wextra -Werror -c main_hello.c
gcc hello.o main_hello.o
./a.out
rm hello.o main_hello.o a.out
