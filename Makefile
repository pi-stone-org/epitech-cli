##
## EPITECH PROJECT, 2024
## epitech cli
## File description:
## Main compilation unit
##

############
## Macros ##
############

# Name
NAME	?= epitech-cli
LIBS	?= git-controller

## Folders and non changing names
SRC_FOLDER	:= src
SRC_LIST	:= src.mk
LIB_FOLDER	:= lib
HEADER_FOLDER	:= include
TEST_FOLDER	:= tests
TEST_SRC_LIST	:= test_src.mk
VERSION_FILE	:= version.txt
VERSION         := $(-shell cat $(VERSION_FILE))

## Flags and binaries to use
CC		?= gcc
CFLAGS		?= -Wall -Wextra
CPPFLAGS	?= -I$(HEADER_FOLDER)
LIBFLAGS	?=

## LIBRARIES
LIBS_SRC	:= $(addprefix $(LIB_FOLDER)/, $(LIBS))
LIBS_FLAGS	:= $(addprefix -L$(LIB_FOLDER)/, $(LIBS))
LIBS_OBJ	:= $(addsuffix .a, $(addprefix lib, $(LIBS)))
LIBS_OBJ_FLAGS	:= $(addprefix -l, $(LIBS))
LIBFLAGS	+= $(LIBS_FLAGS) $(LIBS_OBJ_FLAGS)
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

$(LIBS_OBJ): $(LIBS_SRC)
	$(MAKE) -C $< $@

$(OBJ): $(SRC)
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(LIBFLAGS) $< -o $@

$(TEST_OBJ): $(TEST_SRC)
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(LIBFLAGS) $< -o $@

$(NAME): $(OBJ) | $(LIBS_OBJ)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LIBFLAGS) $< -o $@

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
