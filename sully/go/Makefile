NAME		:= Sully
CC			:= go
EXT			:= go
SRCS 		:= Sully.$(EXT)

.PHONY:	all
all:	$(NAME)

$(NAME):
	go build -o $(NAME) $(SRCS)

.PHONY:	clean
clean:
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