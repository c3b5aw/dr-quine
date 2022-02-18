NAME		:= Colleen
LD			:= cc
LDFLAGS		:= -no-pie -Wall -Wextra -Werror

CC			:= nasm
CFLAGS		:= -f elf64

SRCS 		:= Colleen.s
OBJS		:= $(SRCS:.s=.o)

.PHONY:	all
all:	$(NAME)

$(NAME): $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o $(NAME)

%.o :%.s
	$(CC) $(CFLAGS) $< -o $@

.PHONY:	clean
clean:
	rm -rf $(OBJS)
	rm -f $(NAME).out

.PHONY: fclean
fclean: clean
	rm -f $(NAME)

.PHONY: re
re: fclean all

.PHONY: test
test: re
	./$(NAME) > $(NAME).out
	diff $(NAME).out $(SRCS)