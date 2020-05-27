SRC = src/strlen.asm \
			src/strchr.asm \
			src/memset.asm \
			src/memcpy.asm \
			src/strcmp.asm \
			src/memmove.asm \
			src/strcm.asm

LD = ld
ASM = nasm
OBJ = $(SRC:.asm=.o)
NAME = libasm.so
ASMCFLAGS = -f elf64 -g
LDFLAGS = -fPIC -shared -g

%.o: %.asm
	$(ASM) -o $@ $< $(ASMCFLAGS)

all:	$(NAME)

$(NAME): $(OBJ)
	$(LD) $(LDFLAGS) -o $(NAME) $(OBJ)

clean:
	rm -f src/*.o

fclean: clean
	rm -f $(NAME)

re: clean fclean all

.PHONY: all clean fclean re
