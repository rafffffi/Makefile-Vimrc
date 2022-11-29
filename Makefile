CC = gcc
CFLAGS = -std=c99 -Wall -Wextra -Werror -pedantic -Wvla -D_POSIX_C_SOURCE=200809L -fsanitize=address -g
LDFLAGS= -fsanitize=address -lcriterion
OBJ = src/evalexpr.o src/my_atoi.o src/stack.o
BIN = evalexpr
TEST_OBJS = tests/testsuite.o

.PHONY: check clean all debug

all:  $(BIN)

$(BIN): $(OBJ)
	$(CC) $(LDFLAGS)  $^ -o $@

check: $(OBJ) $(TEST_OBJS)
	$(CC) $^ $(LDFLAGS) -o testsuite
	./testsuite

debug: CFLAGS += -g

debug: all

clean:
	$(RM) $(BIN) $(OBJ) $(TEST_OBJS) testsuite
