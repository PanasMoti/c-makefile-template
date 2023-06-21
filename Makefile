# Makefile variables
PROJECT_NAME := ProjectName
CC := gcc
CFLAGS := -Wall -Werror -std=c99
LDFLAGS :=
SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin
INC_DIR := include
RES_DIR := res

# Automatic file collection
SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

# Executable path
EXECUTABLE := $(BIN_DIR)/$(PROJECT_NAME)

# Default target
all: $(EXECUTABLE) copy_resources

# Compile source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -I$(INC_DIR) -c $< -o $@

# Link object files into executable
$(EXECUTABLE): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(LDFLAGS) $^ -o $@

# Copy resources to the bin directory
copy_resources:
	@mkdir -p $(BIN_DIR)
	cp -r $(RES_DIR) $(BIN_DIR)

# Clean the generated files
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
# Sync the resource files

sync-res:
	rm -rf $(BIN_DIR)/$(RES_DIR)/*
	cp -r $(RES_DIR) $(BIN_DIR)

# Run the executable
run: $(EXECUTABLE)
	$(EXECUTABLE)

.PHONY: all copy_resources clean run
