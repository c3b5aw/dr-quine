NAME		:= Grace
CC			:= go
EXT			:= go
SRCS 		:= Grace.$(EXT)

.PHONY:	all
all:	$(NAME)

$(NAME):
	$(CC) build -o $(NAME) $(SRCS)

.PHONY:	clean
clean:
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