NAME		:= Grace
CC			:= cc
CFLAGS		:= -Wall -Wextra -Werror
SRCS 		:= Grace.c
OBJS		:= $(SRCS:.c=.o)

.PHONY:	all
all:	$(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY:	clean
clean:
	rm -rf $(OBJS)

.PHONY: fclean
fclean: clean
	rm -f $(NAME)

.PHONY: re
re: fclean all

.PHONY: test
test: re
	./$(NAME)
	diff $(NAME).c $(NAME)_kid.c