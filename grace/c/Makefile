NAME		:= Grace
CC			:= cc
CFLAGS		:= -Wall -Wextra -Werror
EXT			:= c
SRCS 		:= Grace.$(EXT)
OBJS		:= $(SRCS:.c=.o)

.PHONY:	all
all:	$(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME)

%.o: %.$(EXT)
	$(CC) $(CFLAGS) -c $< -o $@

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