CC		= nasm
CFLAGS	= -felf64
NAME 	= libasm.a

SRC		= hello.asm \

OBJDIR	= obj
OBJ		= $(SRC:%.asm=$(OBJDIR)/%.o)
INCLUDES= ./

vpath %.asm examples

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

test:
	gcc examples/main_hello.c -lasm -L. && ./a.out && rm a.out

