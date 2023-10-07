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
    char src1[100] = "abc";
    char dst1[100] = "cdef";
    char src2[100] = "abc";
    char dst2[100] = "cdef";

    strcpy(src1, "abc");
    strcpy(src1, "cdef");
    strcpy(src2, "abc");
    strcpy(src2, "cdef");

    ft_strcpy(dst1, src1);
    strcpy(dst2, src2);
    assert(strcmp(dst2, dst1) == 0);

    strcpy(src1, "");
    strcpy(dst1, "cdef");
    strcpy(src2, "");
    strcpy(dst2, "cdef");

    ft_strcpy(dst1, src1);
    strcpy(dst2, src2);
    assert(strcmp(dst2, dst1) == 0);
    assert(*src1 == '\0');

    strcpy(src1, "");
    strcpy(dst1, "");
    strcpy(src2, "");
    strcpy(dst2, "");

    ft_strcpy(dst1, src1);
    strcpy(dst2, src2);
    assert(strcmp(dst2, dst1) == 0);
    assert(*src1 == '\0');
}

void test_strcmp(void) {
    assert(ft_strcmp("a", "a") == 0);
    assert(ft_strcmp("ab", "a") > 0);
    assert(ft_strcmp("a", "ab") < 0);
    assert(ft_strcmp("a", "b") < 0);
    assert(ft_strcmp("b", "a") > 0);
}
