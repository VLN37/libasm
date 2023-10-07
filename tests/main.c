#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern void hello_world();
extern int ft_strlen();

int main (void) {
    char *string = strdup("salada");

    string[2] = '\0';
    hello_world();

    assert(ft_strlen("ararar") == 6);
    assert(ft_strlen("") == 0);
    assert(ft_strlen(string) == 2);

    free(string);
}
