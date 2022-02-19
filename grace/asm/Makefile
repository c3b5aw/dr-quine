NAME		:= Grace
LD			:= cc
LDFLAGS		:= -no-pie -Wall -Wextra -Werror

CC			:= nasm
CFLAGS		:= -f elf64
EXT			:= s

SRCS 		:= Grace.$(EXT)
OBJS		:= $(SRCS:.$(EXT)=.o)

.PHONY:	all
all:	$(NAME)

$(NAME): $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o $(NAME)

%.o :%.s
	$(CC) $(CFLAGS) $< -o $@

.PHONY:	clean
clean:
	rm -rf $(OBJS)
	rm -f $(NAME)_kid.$(EXT)

.PHONY: fclean
fclean: clean
	rm -f $(NAME)

.PHONY: re
re: fclean all

.PHONY: test
test: re
	./$(NAME)
	diff $(NAME).$(EXT) $(NAME)_kid.$(EXT)