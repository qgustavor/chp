# CHP (Create Hidden Process) Makefile
# Windows-only build configuration

# Compiler and flags
CC = gcc
CFLAGS = -DUNICODE -D_UNICODE -Os -Wall -Wextra
LDFLAGS = -s -mwindows
TARGET = chp.exe

# Source files
SOURCES = main.c

# Default target
.PHONY: all clean dist help

all: $(TARGET)

# Simple build - single command for a single-file project
$(TARGET): $(SOURCES)
	@echo "Building $(TARGET) for Windows..."
	@$(CC) $(CFLAGS) $(LDFLAGS) -o $(TARGET) $(SOURCES)
	@echo "Build complete: $(TARGET)"
	@echo "Usage: $(TARGET) your-script.bat"

# Clean build files
clean:
	@echo "Cleaning..."
	@del /Q $(TARGET) 2>nul || rm -f $(TARGET)
	@echo "Clean complete"

# Create distribution package
dist: $(TARGET)
	@echo "Creating distribution package..."
	@if exist README.txt (zip chp-dist.zip $(TARGET) README.txt COPYING.txt) else (zip chp-dist.zip $(TARGET))
	@echo "Created chp-dist.zip"

# Help
help:
	@echo "CHP (Create Hidden Process) - Windows Build"
	@echo ""
	@echo "Available targets:"
	@echo "  all     - Build chp.exe (default)"
	@echo "  clean   - Remove build files"
	@echo "  dist    - Create distribution zip"
	@echo "  help    - Show this help"
	@echo ""
	@echo "Installation: Just copy chp.exe to any directory in your PATH"
	@echo "or keep it with your scripts and use the full path."
	@echo ""
	@echo "Usage after build:"
	@echo "  chp.exe your-script.bat       # Run batch script hidden"
	@echo "  chp.exe backup-task.bat       # Perfect for Task Scheduler"
	@echo "  chp.exe cmd.exe /c \"dir > log.txt\"  # Run console commands silently"
	@echo ""
	@echo "WARNING: Don't use with GUI apps - they become unusable zombie processes!"
