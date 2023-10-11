CC		= nasm
CFLAGS	= -felf64 -F dwarf -g
NAME 	= libasm.a

SRC		= hello.s \
		  ft_strlen.s \
		  ft_strcpy.s \
		  ft_strcmp.s \
		  ft_write.s \
		  ft_read.s \
		  ft_strdup.s \
		  ft_list_size.s \
		  ft_list_add_front.s \

OBJDIR	= obj
OBJ		= $(SRC:%.s=$(OBJDIR)/%.o)
INCLUDES= ./

vpath %.s src %.s examples

all: $(NAME)

$(NAME): $(OBJDIR) $(OBJ)
	ar rcs $(NAME) $(OBJ)

$(OBJDIR)/%.o: %.s
	$(CC) $(CFLAGS) $< -o $@ -I $(INCLUDES)

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -rf $(OBJDIR)

fclean: clean
	rm -rf $(NAME)

re: fclean all

test: all
	gcc -g3 tests/main.c -lasm -L. && echo 'Goodbye, World' | valgrind ./a.out

test_bonus: all
	gcc -g3 tests/main_bonus.c -lasm -L. && valgrind ./a.out
