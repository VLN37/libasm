CC			= nasm
CFLAGS		= -felf64 -F dwarf -g
NAME 		= libasm.a
NAMEB		= libasm_bonus.a

SRC			= hello.s \
			  ft_strlen.s \
			  ft_strcpy.s \
			  ft_strcmp.s \
			  ft_write.s \
			  ft_read.s \
			  ft_strdup.s

SRCB		= ft_list_size.s \
			  ft_list_add_front.s \

OBJDIR		= obj
OBJ			= $(SRC:%.s=$(OBJDIR)/%.o)
OBJB		= $(SRCB:%.s=$(OBJDIR)/%.o)
INCLUDES	= ./

vpath %.s src %.s examples

$(NAME): $(OBJDIR) $(OBJ)
	ar rcs $(NAME) $(OBJ)


$(NAMEB): $(NAME) $(OBJDIR) $(OBJB)
	cp $(NAME) $(NAMEB)
	ar rcs $(NAMEB) $(OBJB)

all: $(NAME) $(NAMEB)

bonus: $(NAMEB)

$(OBJDIR)/%.o: %.s
	$(CC) $(CFLAGS) $< -o $@ -I $(INCLUDES)

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -rf $(OBJDIR)

fclean: clean
	rm -rf $(NAME) $(NAMEB)

re: fclean all

test: all
	gcc -g3 tests/main.c -L. -lasm && echo 'Goodbye, World' | valgrind ./a.out
	rm a.out

test_bonus: all
	gcc -g3 tests/main_bonus.c -L. -lasm_bonus && valgrind ./a.out
	rm a.out
