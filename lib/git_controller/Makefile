##
## EPITECH PROJECT, 2024
## git controller library
## File description:
## makefile for the git controller library
##

############
## Macros ##
############

## Name
LIB_NAME	:= git-controller
NAME		:= lib$(LIB_NAME).a

## Folders and non changing names
SRC_FOLDER	:= src
SRC_LIST	:= src.mk
HEADER_FOLDER	:= include
TEST_FOLDER	:= tests

## Flags and binaries to use
CC		?= gcc
AR		?= ar
CFLAGS		?= -Wall -Wextra
CPPFLAGS	?= -I$(HEADER_FOLDER)
LIBFLAGS	?=

## SRC and OBJ
-include	$(SRC_LIST)
SRC		:= $(addprefix $(SRC_FOLDER)/, $(SRC))
OBJ		:= $(SRC:.c=.o)

###########
## Rules ##
###########

all: $(NAME)

$(OBJ): $(SRC)
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(LIBFLAGS) $< -o $@

$(NAME): $(OBJ)
	$(AR) rcs $@ $^

## Stands for Emacs CLEAN
eclean:
	find . \( -name "*~" -or -name "#*#" \
	-or -name "*core*" -or -name "*.gcda" \
	-or -name "*.gcno" \) -exec rm '{}' \;

oclean:
	$(RM) $(OBJ)

clean: oclean eclean

fclean: clean
	$(RM) $(NAME)

coding-style-reports.log: fclean
	coding-style . .
	@echo -e "Coding style report (may not be present) :\n"
	@cat $@ 2>/dev/null || true

.PHONY: all eclean aclean oclean fclean
