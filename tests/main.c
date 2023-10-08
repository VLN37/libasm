#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern void hello_world();
extern int ft_strlen();
extern char *ft_strcpy();
extern int ft_strcmp();

void test_strlen();
void test_strcpy();
void test_strcmp();

int main(void) {
    hello_world();
    test_strlen();
    test_strcpy();
    test_strcmp();
}

void test_strlen(void) {
    char string[] = "salada";
    string[2] = '\0';

    assert(ft_strlen("ararar") == 6);
    assert(ft_strlen("") == 0);
    assert(ft_strlen(string) == 2);
}

void test_strcpy(void) {
    // copies the immutable strings to the char arrays on the stack
    char src[10];
    char dst[10];

    strcpy(src, "abc");
    strcpy(src, "cdef");
    ft_strcpy(dst, src);
    assert(strcmp(src, dst) == 0);

    strcpy(src, "");
    strcpy(dst, "cdef");
    ft_strcpy(dst, src);
    assert(strcmp(src, dst) == 0);
    assert(*dst == '\0');

    strcpy(src, "");
    strcpy(dst, "");
    ft_strcpy(dst, src);
    assert(strcmp(src, dst) == 0);
    assert(*dst == '\0');
}

void test_strcmp(void) {
    assert(ft_strcmp("", "") == 0);
    assert(ft_strcmp("", "a") < 0);
    assert(ft_strcmp("a", "") > 0);
    assert(ft_strcmp("a", "a") == 0);
    assert(ft_strcmp("ab", "a") > 0);
    assert(ft_strcmp("a", "ab") < 0);
    assert(ft_strcmp("a", "b") < 0);
    assert(ft_strcmp("b", "a") > 0);
}
