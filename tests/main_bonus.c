#include "tests.h"


int main(void) {
    printf("Hello, Bonus\n");
    test_list_size();
}

void test_list_size() {
    t_list obj1;
    t_list obj2;
    t_list *head;

    head = &obj1;
    obj1.data = (void *)0x42;
    obj1.next = NULL;
    assert(ft_list_size(NULL) == 0);
    obj2.next = NULL;
    assert(ft_list_size(head) == 1);
    obj1.next = &obj2;
    assert(ft_list_size(head) == 2);
}
