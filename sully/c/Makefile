NAME		:= Sully
CC			:= cc
CFLAGS		:= -Wall -Wextra -Werror
EXT			:= c
SRCS 		:= Sully.$(EXT)
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
	rm -f $(NAME)_*

.PHONY: fclean
fclean: clean
	rm -f $(NAME)

.PHONY: re
re: fclean all

.PHONY: test
test: re
	./$(NAME)
	ls -al | grep $(NAME) | wc -l
	diff $(NAME).$(EXT) $(NAME)_0.$(EXT)