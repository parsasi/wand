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

# Create a symlink for ~/.zshrc to ~/wand/.zshrc
ln -s ~/wand/.zshrc ~/.zshrc

# Create a symlink for ~/.config/lvim to ~/wand/lvim
ln -s ~/wand/lvim ~/.config/lvim

# Prompt for the prod context name
read -p "Enter the context name for bnw prod: " prod_context
echo "$prod_context" > "$(dirname "$0")/bnw-prod.txt"

read -p "Enter the context name for bnw staging: " staging_context
echo "$staging_context" > "$(dirname "$0")/bnw-staging.txt"

read -p "Enter your ChatGPT API Key: " chatgpt_api_key
echo "$chatgpt_api_key" > "$(dirname "$0")/.chatgpt-api-key"


# Check if target directory is provided as argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <target_directory>"
    exit 1
fi
