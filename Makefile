LIB := libft.a

# **************************************************************************** #

SRC_DIR := src

# **************************************************************************** #



# **************************************************************************** #

INC_DIRS := include \
            include/internal \
            include/internal/printf

# **************************************************************************** #

OBJ_DIR := obj

OBJ := $(addprefix $(OBJ_DIR)/, $(COMPLEX_OBJ) \
                                $(CTYPE_OBJ) \
                                $(LIST_OBJ) \
                                $(MATH_OBJ) \
                                $(STDIO_OBJ) \
                                $(STDLIB_OBJ) \
                                $(STRING_OBJ) \
                                $(VECTOR_OBJ))

DEP := $(addprefix $(OBJ_DIR)/, $(COMPLEX_DEP) \
                                $(CTYPE_DEP) \
                                $(LIST_DEP) \
                                $(MATH_DEP) \
                                $(STDIO_DEP) \
                                $(STDLIB_DEP) \
                                $(STRING_DEP) \
                                $(VECTOR_DEP))

# **************************************************************************** #

UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S), Darwin)
    CC := clang
endif

ifeq ($(UNAME_S), Linux)
    CC := gcc
endif

# **************************************************************************** #

CFLAGS += -Wall -Wextra -Werror \
          $(addprefix -I , $(INC_DIRS)) \
          -MMD \
          -O2 -march=native -ftree-vectorize -pipe

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

.PHONY: all clean fclean re

# **************************************************************************** #

all:
	@$(MAKE) $(LIB)

# **************************************************************************** #

$(LIB): $(OBJ)
	@printf "$(BLUE)"
	ar -cr $@ $?
	ranlib $@
	@printf "$(RESET)"

# **************************************************************************** #

$(OBJ_DIR)/$(COMPLEX_DIR):
	@mkdir -p $@

$(OBJ_DIR)/$(COMPLEX_DIR)/%.o: $(SRC_DIR)/$(COMPLEX_DIR)/%.c | $(OBJ_DIR)/$(COMPLEX_DIR)
	@printf "$(MAGENTA)"
	$(CC) $(CFLAGS) -c $< -o $@
	@printf "$(RESET)"

# **************************************************************************** #

$(OBJ_DIR)/$(CTYPE_DIR):
	@mkdir -p $@

$(OBJ_DIR)/$(CTYPE_DIR)/%.o: $(SRC_DIR)/$(CTYPE_DIR)/%.c | $(OBJ_DIR)/$(CTYPE_DIR)
	@printf "$(MAGENTA)"
	$(CC) $(CFLAGS) -c $< -o $@
	@printf "$(RESET)"

# **************************************************************************** #

$(OBJ_DIR)/$(LIST_DIR):
	@mkdir -p $@

$(OBJ_DIR)/$(LIST_DIR)/%.o: $(SRC_DIR)/$(LIST_DIR)/%.c | $(OBJ_DIR)/$(LIST_DIR)
	@printf "$(MAGENTA)"
	$(CC) $(CFLAGS) -c $< -o $@
	@printf "$(RESET)"

# **************************************************************************** #

$(OBJ_DIR)/$(MATH_DIR):
	@mkdir -p $@

$(OBJ_DIR)/$(MATH_DIR)/%.o: $(SRC_DIR)/$(MATH_DIR)/%.c | $(OBJ_DIR)/$(MATH_DIR)
	@printf "$(MAGENTA)"
	$(CC) $(CFLAGS) -c $< -o $@
	@printf "$(RESET)"

# **************************************************************************** #

$(OBJ_DIR)/$(STDIO_DIR)/$(PRINTF_DIR):
	@mkdir -p $@

$(OBJ_DIR)/$(STDIO_DIR)/$(PRINTF_DIR)/%.o: $(SRC_DIR)/$(STDIO_DIR)/$(PRINTF_DIR)/%.c | $(OBJ_DIR)/$(STDIO_DIR)/$(PRINTF_DIR)
	@printf "$(MAGENTA)"
	$(CC) $(CFLAGS) -c $< -o $@
	@printf "$(RESET)"

$(OBJ_DIR)/$(STDIO_DIR):
	@mkdir -p $@

$(OBJ_DIR)/$(STDIO_DIR)/%.o: $(SRC_DIR)/$(STDIO_DIR)/%.c | $(OBJ_DIR)/$(STDIO_DIR)
	@printf "$(MAGENTA)"
	$(CC) $(CFLAGS) -c $< -o $@
	@printf "$(RESET)"

# **************************************************************************** #

$(OBJ_DIR)/$(STDLIB_DIR):
	@mkdir -p $@

$(OBJ_DIR)/$(STDLIB_DIR)/%.o: $(SRC_DIR)/$(STDLIB_DIR)/%.c | $(OBJ_DIR)/$(STDLIB_DIR)
	@printf "$(MAGENTA)"
	$(CC) $(CFLAGS) -c $< -o $@
	@printf "$(RESET)"

# **************************************************************************** #

$(OBJ_DIR)/$(STRING_DIR):
	@mkdir -p $@

$(OBJ_DIR)/$(STRING_DIR)/%.o: $(SRC_DIR)/$(STRING_DIR)/%.c | $(OBJ_DIR)/$(STRING_DIR)
	@printf "$(MAGENTA)"
	$(CC) $(CFLAGS) -c $< -o $@
	@printf "$(RESET)"

# **************************************************************************** #

$(OBJ_DIR)/$(VECTOR_DIR):
	@mkdir -p $@

$(OBJ_DIR)/$(VECTOR_DIR)/%.o: $(SRC_DIR)/$(VECTOR_DIR)/%.c | $(OBJ_DIR)/$(VECTOR_DIR)
	@printf "$(MAGENTA)"
	$(CC) $(CFLAGS) -c $< -o $@
	@printf "$(RESET)"

# **************************************************************************** #

-include $(DEP)

# **************************************************************************** #

clean:
	@printf "$(RED)"
	rm -rf $(OBJ_DIR)
	@printf "$(RESET)"

fclean: clean
	@printf "$(RED)"
	rm -f $(LIB)
	@printf "$(RESET)"

re: fclean all
