#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>

extern void hello_world();
extern int ft_strlen();
extern char *ft_strcpy();
extern int ft_strcmp();
extern size_t ft_write(int, void *, size_t);
extern size_t ft_read(int, void *, size_t);

void test_strlen();
void test_strcpy();
void test_strcmp();
void test_write();
void test_read();
