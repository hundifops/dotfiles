#!/bin/bash

echo "Installing dotfiles..."

DOTFILES_DIR="$HOME/dotfiles"

ln -sf "DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

if ! command -v brew &> /dev/null
then
    echo "Homebrew was not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v brew &> /dev/null
then
    echo "Oh-My-Zsh was not found. Installing package..."
    /bin/bash sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "dotfiles installation complete"
