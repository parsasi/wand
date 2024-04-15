#!/bin/bash

# # Check if target directory is provided as argument
# if [ $# -eq 0 ]; then
#     echo "Usage: $0 <target_directory>"
#     exit 1
# fi

# # Extract target directory from arguments
# target_directory="$1"

# # Check if target directory exists
# if [ ! -d "$target_directory" ]; then
#     echo "Error: Target directory '$target_directory' does not exist"
#     exit 1
# fi

# # Create symlink in home directory pointing to target directory
# ln -s "$target_directory" ~/wand

# echo "Symlink created: ~/wand -> $target_directory"


# Prompt for the prod context name
read -p "Enter the context name for bnw prod: " prod_context

# Store the context in bnw-prod.txt
echo "$prod_context" > "$(dirname "$0")/bnw-prod.txt"

# Prompt for the staging context name
read -p "Enter the context name for bnw staging: " staging_context

# Store the context in bnw-staging.txt
echo "$staging_context" > "$(dirname "$0")/bnw-staging.txt"

# Check if target directory is provided as argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <target_directory>"
    exit 1
fi
