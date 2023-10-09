#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>

#define SYS_ERROR -1

typedef struct      s_list
{
    void            *data;
    struct s_list   *next;
}                   t_list;

extern void     hello_world();
extern int      ft_strlen();
extern char     *ft_strcpy();
extern int      ft_strcmp();
extern size_t   ft_write(int, void *, size_t);
extern size_t   ft_read(int, void *, size_t);
extern char     *ft_strdup(const char *);
extern int      ft_list_size(void *);
extern void     ft_list_add_front(t_list **begin, t_list *new);

void            test_strlen();
void            test_strcpy();
void            test_strcmp();
void            test_write();
void            test_read();
void            test_strdup();
void            test_push_front();

void            test_list_size();
