#!/bin/bash

# Check if target directory is provided as argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <target_directory>"
    exit 1
fi

# Extract target directory from arguments
target_directory="$1"

# Check if target directory exists
if [ ! -d "$target_directory" ]; then
    echo "Error: Target directory '$target_directory' does not exist"
    exit 1
fi

# Create symlink in home directory pointing to target directory
ln -s "$target_directory" ~/wand

echo "Symlink created: ~/wand -> $target_directory"

