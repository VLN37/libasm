CC		= nasm
CFLAGS	= -felf64 -F dwarf -g
NAME 	= libasm.a

SRC		= hello.asm \
		  ft_strlen.asm \
		  ft_strcpy.asm \
		  ft_strcmp.asm \
		  ft_write.asm \
		  ft_read.asm \
		  ft_strdup.asm \
		  ft_list_size.asm \

OBJDIR	= obj
OBJ		= $(SRC:%.asm=$(OBJDIR)/%.o)
INCLUDES= ./

vpath %.asm src examples

all: $(NAME)

$(NAME): $(OBJDIR) $(OBJ)
	ar rcs $(NAME) $(OBJ)

$(OBJDIR)/%.o: %.asm
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
