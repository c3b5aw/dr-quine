NAME		:= Colleen
CC			:= go
SRCS 		:= Colleen.go

.PHONY:	all
all:	$(NAME)

$(NAME):
	go build -o $(NAME) $(SRCS)

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