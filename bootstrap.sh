#!/bin/bash

echo "Installing dotfiles..."

DOTFILES_DIR="$HOME/.dotfiles"

ln -sf "DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"

if ! command -v brew &> /dev/null
then
    echo "Homebrew was not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"