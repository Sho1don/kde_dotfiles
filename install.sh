#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check if GNU Stow is installed, if not - install it via pacman
if ! command -v stow &> /dev/null; then
    echo "Installing GNU Stow..."
    sudo pacman -S --needed stow
fi

# Remove default kitty config if it exists and is a regular file
# This prevents Stow from throwing a conflict error
if [ -f "$HOME/.config/kitty/kitty.conf" ] && [ ! -L "$HOME/.config/kitty/kitty.conf" ]; then
    echo "Removing default kitty.conf to clear space for symlink..."
    rm "$HOME/.config/kitty/kitty.conf"
fi

# Run Stow to link all configurations to the home directory
echo "Creating symlinks via GNU Stow..."
stow .

echo "Done. To check: System Settings -> Global Theme and apply 'Kde Flotats'."
