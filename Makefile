# Compiler and tools
CC      := mingw32-gcc
CFLAGS  := -Os -Wall -municode
LDFLAGS := -s -mwindows

# Targets
TARGET  := chp.exe
SRC     := main.c
OBJ     := $(SRC:.c=.o)

# Default build
all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ) $(TARGET)

.PHONY: all clean
