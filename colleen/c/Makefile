NAME		:= Colleen
CC			:= cc
CFLAGS		:= -Wall -Wextra -Werror
SRCS 		:= colleen.c
OBJS		:= $(SRCS:.c=.o)

.PHONY:	all
all:	$(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME)

%o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

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