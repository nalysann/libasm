NAME := libasm.a
TEST := test

# **************************************************************************** #

SRC_DIR := src
OBJ_DIR := obj

# **************************************************************************** #

SRC := ft_read.s \
       ft_strcmp.s \
       ft_strcpy.s \
       ft_strdup.s \
       ft_strlen.s \
       ft_write.s

OBJ := $(addprefix $(OBJ_DIR)/, $(SRC:.s=.o))

# **************************************************************************** #

SRC_BONUS := ft_atoi_base_bonus.s \
             ft_list_push_front_bonus.s \
             ft_list_remove_if_bonus.s \
             ft_list_size_bonus.s \
             ft_list_sort_bonus.s

OBJ_BONUS := $(addprefix $(OBJ_DIR)/, $(SRC_BONUS:.s=.o))

# **************************************************************************** #

SRC_TEST := main.c

OBJ_TEST := $(addprefix $(OBJ_DIR)/, $(SRC_TEST:.c=.o))

# **************************************************************************** #

INC_DIRS := include

# **************************************************************************** #

ASM := nasm

UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S), Darwin)
    CC := clang
    AFLAGS := -f macho64
endif

ifeq ($(UNAME_S), Linux)
    CC := gcc
    AFLAGS := -f elf64
endif

# **************************************************************************** #

CFLAGS += -Wall -Wextra -Werror \
          $(addprefix -I , $(INC_DIRS)) \
          -MMD \
          -O2 -march=native -ftree-vectorize -pipe

ifdef BONUS
    CFLAGS += -DBONUS
endif

# **************************************************************************** #

RESET   := \033[0;0m
RED     := \033[0;31m
GREEN   := \033[0;32m
YELLOW  := \033[0;33m
BLUE    := \033[0;34m
MAGENTA := \033[0;35m
CYAN    := \033[0;36m
WHITE   := \033[0;37m

# **************************************************************************** #

.PHONY: all bonus clean fclean re

# **************************************************************************** #

all:
	@$(MAKE) $(NAME)

# **************************************************************************** #

$(NAME): $(OBJ)
	@printf "$(BLUE)"
	ar -cr $@ $?
	ranlib $@
	@printf "$(RESET)"

bonus: $(OBJ_BONUS)
	@printf "$(BLUE)"
	ar -cr $(NAME) $?
	ranlib $(NAME)
	@printf "$(RESET)"

$(TEST): $(OBJ_TEST)
	@printf "$(GREEN)"
	$(CC) -L . -lasm $^ -o $(TEST)
	@printf "$(RESET)"

# **************************************************************************** #

$(OBJ_DIR):
	@mkdir -p $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s | $(OBJ_DIR)
	@printf "$(MAGENTA)"
	$(ASM) $(AFLAGS) $< -o $@
	@printf "$(RESET)"

$(OBJ_DIR)/%.o: %.c | $(OBJ_DIR)
	@printf "$(MAGENTA)"
	$(CC) $(CFLAGS) -c $< -o $@
	@printf "$(RESET)"

# **************************************************************************** #

-include $(DEP)

# **************************************************************************** #

clean:
	@printf "$(RED)"
	rm -rf $(OBJ_DIR) *.txt
	@printf "$(RESET)"

fclean: clean
	@printf "$(RED)"
	rm -f $(NAME) $(TEST)
	@printf "$(RESET)"

re: fclean all
