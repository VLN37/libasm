#include "tests.h"

int main(void) {
    hello_world();
    test_strlen();
    test_strcpy();
    test_strcmp();
    test_write();
    test_read();
}

void test_strlen(void) {
    char    string[] = "salada";

    string[2] = '\0';
    assert(ft_strlen("ararar") == 6);
    assert(ft_strlen("") == 0);
    assert(ft_strlen(string) == 2);
}

void test_strcpy(void) {
    char    src[10];
    char    dst[10];

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

void test_write(void) {
    int     len;
    char    *msg;

    msg = "assemble!\n";
    len = ft_strlen(msg);

    assert(ft_write(50, msg, len) == SYS_ERROR);
    perror("write");
    assert(ft_write(STDOUT_FILENO, msg, len) == len);
    perror("write");
}

void test_read(void) {
    char    buf[100];
    int     bytes_read;
    int     len;

    len = ft_strlen("Goodbye, World\n");

    assert(ft_read(50, buf, 99) == SYS_ERROR);
    perror("read");
    assert(ft_read(STDIN_FILENO, buf, 99) == len);
    perror("read");
    ft_write(STDOUT_FILENO, buf, len);
}
