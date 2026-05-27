NAME = libftprintf.a

CC = cc
CFLAGS = -Wall -Wextra -Werror -I$(LIBFT_DIR)
AR = ar rcs
RM = rm -rf

LIBFT_DIR = ./libft
LIBFT = $(LIBFT_DIR)/libft.a

SOURCES = ft_printf.c
OBJECTS = $(SOURCES:.c=.o)

GREEN = \033[0;32m
NC = \033[0m
RED = \033[0;31m
YELLOW = \033[0;33m
CYAN = \033[0;36m
WHITE = \033[1;37m

TOTAL_OBJ = $(words $(OBJECTS))

all: $(NAME)

$(NAME): printf_header
	@echo "$(YELLOW)Compiling external Libft...$(NC)"
	@$(MAKE) -s --no-print-directory -C $(LIBFT_DIR) > /dev/null 2>&1
	@echo "$(GREEN)Libft compilation completed.$(NC)"
	@$(MAKE) -s --no-print-directory compile_objects
	@cp $(LIBFT) $(NAME)
	@$(AR) $(NAME) $(OBJECTS)
	@echo ""
	@echo "$(GREEN)ft_printf compilation completed!$(NC)"

compile_objects: $(OBJECTS)

printf_header:
	@if [ ! -f $(NAME) ]; then \
		echo "$(CYAN)"; \
		echo "  _____  _____  _____ _   _ _______ ______ "; \
		echo " |  __ \\|  __ \\|_   _| \\ | |__   __|  ____|"; \
		echo " | |__) | |__) | | | |  \\| |  | |  | |__   "; \
		echo " |  ___/|  _  /  | | | . \` |  | |  |  __|  "; \
		echo " | |    | | \\ \\ _| |_| |\\  |  | |  | |     "; \
		echo " |_|    |_|  \\_\\_____|_| \\_|  |_|  |_|     "; \
		echo "                                           "; \
		echo "          $(WHITE)By: mapena-z$(CYAN)           "; \
		echo "$(NC)"; \
	fi

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@
	@$(MAKE) -s progress

clean:
	@$(RM) $(OBJECTS)
	@$(MAKE) -s --no-print-directory -C $(LIBFT_DIR) clean > /dev/null 2>&1
	@echo "$(YELLOW)Cleaning up object files for ft_printf...$(NC)"

fclean:
	@$(RM) $(OBJECTS) $(NAME)
	@$(MAKE) -s --no-print-directory -C $(LIBFT_DIR) fclean > /dev/null 2>&1
	@echo "$(RED)ft_printf fully cleaned!$(NC)"

re: fclean all

progress:
	@$(eval COMPLETED = $(shell ls -1 $(OBJECTS) 2>/dev/null | wc -l))
	@if [ $(TOTAL_OBJ) -gt 0 ]; then \
		PERCENTAGE=$$(echo "scale=2; 100 * $(COMPLETED) / $(TOTAL_OBJ)" | bc); \
		BAR_LENGTH=50; \
		FILLED_LENGTH=$$(echo "$$BAR_LENGTH * $(COMPLETED) / $(TOTAL_OBJ)" | bc); \
		EMPTY_LENGTH=$$(echo "$$BAR_LENGTH - $$FILLED_LENGTH" | bc); \
		BAR=$$(yes "=" | head -n $$FILLED_LENGTH | tr -d '\n'); \
		EMPTY=$$(yes " " | head -n $$EMPTY_LENGTH | tr -d '\n'); \
		echo -n "$(GREEN)[$$BAR$$EMPTY] $$PERCENTAGE%\r"; \
	fi
	@sleep 0.02

.PHONY: all clean fclean re progress printf_header compile_objects