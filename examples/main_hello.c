#include <assert.h>
#include <stdio.h>

extern void hello_world();
extern int ft_strlen();

int main (void) {
    hello_world();
    printf("%d\n", ft_strlen("ararar"));
    assert(ft_strlen("ararar") == 6);
}
