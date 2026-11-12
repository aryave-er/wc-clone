CC      = gcc
CFLAGS  = -Wall -Wextra -O2
TARGET  = mywc

all: $(TARGET)

$(TARGET): wc.c
	$(CC) $(CFLAGS) -o $(TARGET) wc.c

test: $(TARGET)
	./test.sh

clean:
	rm -f $(TARGET)

.PHONY: all test clean