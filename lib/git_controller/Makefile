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
TEST_SRC_LIST	:= test_src.mk
VERSION_FILE	:= version.txt
VERSION		:= $(shell cat $(VERSION_FILE))

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
## Test SRC and OBJ
-include	$(TEST_SRC_LIST)
TEST_SRC	:= $(addprefix $(TEST_FOLDER)/, $(TEST_SRC))
TEST_OBJ	:= $(TEST_SRC:.c=.o)

###########
## Rules ##
###########

all: $(NAME)
	@echo "Processing $(NAME)@$(VERSION)"

$(OBJ): $(SRC)
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(LIBFLAGS) $< -o $@

$(TEST_OBJ): $(TEST_SRC)
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

fclean:
	$(RM) $(NAME)

re: clean fclean all

coding-style-reports.log: fclean
	coding-style . .
	@echo -e "Coding style report (may not be present) :\n"
	@cat $@ 2>/dev/null || true

unit_tests: $(OBJ) $(TEST_OBJ)
	$(CC) -o unit_tests $(OBJ) $(TEST_OBJ) $(CFLAGS) \
	$(CPPFLAGS) $(LIBFLAGS) --coverage -lcriterion

tests_run: unit_tests
	@./unit_tests
	@$(RM) unit_tests

## Other name for tests_run
criterion: tests_run

full_test_run: unit_tests
	@./unit_tests
	@gcovr --exclude tests unit_tests
	@gcovr --exclude tests --branches unit_tests
	@$(RM) unit_tests
	@$(RM) *.gcda
	@$(RM) *.gcno

.PHONY: all eclean aclean oclean fclean tests_run criterion
