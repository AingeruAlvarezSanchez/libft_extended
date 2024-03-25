NAME = libft.a

CC = cc
CFLAGS = -c -Wall -Werror -Wextra
SANITIZE_FLAGS = -g3 -fsanitize=address -fsanitize=leak
AR_FLAGS = rcs

SRC = src/ft_isalpha.c    \
      src/ft_isdigit.c    \
      src/ft_isalnum.c    \
      src/ft_isascii.c    \
      src/ft_isprint.c    \
      src/ft_strlen.c     \
      src/ft_memset.c     \
      src/ft_bzero.c      \
      src/ft_memcpy.c     \
      src/ft_memmove.c    \
      src/ft_strlcpy.c    \
      src/ft_strlcat.c    \
      src/ft_toupper.c    \
      src/ft_tolower.c    \
      src/ft_strchr.c     \
      src/ft_strrchr.c    \
      src/ft_strncmp.c    \
      src/ft_memchr.c     \
      src/ft_memcmp.c     \
      src/ft_strnstr.c    \
      src/ft_atoi.c       \
      src/ft_calloc.c     \
      src/ft_strdup.c     \
      src/ft_substr.c     \
      src/ft_strjoin.c    \
      src/ft_strtrim.c    \
      src/ft_split.c      \
      src/ft_itoa.c       \
      src/ft_strmapi.c    \
      src/ft_striteri.c   \
      src/ft_putchar_fd.c \
      src/ft_putstr_fd.c  \
      src/ft_putendl_fd.c \
      src/ft_putnbr_fd.c

OBJ = $(patsubst src/%.c, obj/%.o, $(SRC))
OBJ_DIR = ./obj

INCLUDE = -I./inc

.PHONY: all
all: $(NAME)

$(NAME): $(OBJ)
	$(AR) $(AR_FLAGS) $@ $^

obj/%.o: src/%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) $< $(INCLUDE) -o $@

.PHONY: clean
clean:
	$(RM) -r $(OBJ_DIR)

.PHONY: fclean
fclean: clean
	$(RM) $(NAME)

.PHONY: re
re: fclean all

.PHONY: sanitize
sanitize: CFLAGS += $(SANITIZE_FLAGS)
sanitize: all
