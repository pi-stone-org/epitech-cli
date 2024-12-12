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
SRC_FOLDER	:= src/
SRC_LIST	:= src.mk
HEADER_FOLDER	:= include/
TEST_FOLDER	:= tests/

## Flags and binaries to use
CC		?= gcc
AR		?= ar
CFLAGS		?= -Wall -Wextra
CPPFLAGS	?= -Iinclude
LIBFLAGS	?=

## SRC and OBJ
-include	$(SRC_LIST)
OBJ		:= $(SRC:.c=.o)

###########
## Rules ##
###########

all: $(NAME)

$(OBJ):
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

fclean:	clean
	$(RM) $(NAME)

coding-style-reports.log: fclean
	yes | $(RM) $@
	coding-style . .
	@echo -e "Coding style report (may not be present) :\n"
	@cat coding-style-report.log 2>/dev/null || true

.PHONY: all eclean aclean oclean fclean
