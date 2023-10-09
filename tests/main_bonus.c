#include "tests.h"


int main(void) {
    printf("Hello, Bonus\n");
    test_list_size();
    test_push_front();
    printf("Goodbye, Bonus\n");
}

void test_list_size() {
    t_list  obj1;
    t_list  obj2;
    t_list  *head;

    head = &obj1;
    obj1.data = (void *)0x42;
    obj1.next = NULL;
    assert(ft_list_size(NULL) == 0);
    obj2.next = NULL;
    assert(ft_list_size(head) == 1);
    obj1.next = &obj2;
    assert(ft_list_size(head) == 2);
}

void test_push_front() {
    t_list  obj1;
    t_list  obj2;
    t_list  *head;

    obj1.data = (void *)0x42;
    obj1.next = NULL;
    obj2.data = (void *)0x43;
    obj2.next = NULL;
    head = NULL;
    // test error handling
    ft_list_add_front(NULL, &obj2);
    head = &obj1;
    assert(head->data == (void *)0x42);
    ft_list_add_front(&head, &obj2);
    assert(head->data == (void *)0x43);
}
