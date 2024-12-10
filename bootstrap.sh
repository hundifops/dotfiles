#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status

echo "Running..."

# Install zsh
if ! command -v zsh &> /dev/null; then
    echo "Installing zsh..."

    # Determine the package manager and install zsh
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt update
        sudo apt install -y zsh
    elif command -v yum &> /dev/null; then
        sudo yum install -y zsh
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y zsh
    elif command -v pacman &> /dev/null; then
        sudo pacman -Sy --noconfirm zsh
    else
        echo "Unsupported package manager. Please install zsh manually"
        exit 1
    fi
elif [[ "$OS_TYPE" == "darwin"* ]]; then
    if command -v brew &> /dev/null; then
        brew install zsh
    else 
        echo "Homebrew is not installed. Please install homebrew manually"
        exit 1
    fi
else
    echo "zsh is already installed"
fi

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
else
    echo "oh-my-zsh is already installed"
fi

# Copy the .zshrc file to the home directory
ZSHRC_SOURCE="$(pwd)/.zshrc"
ZSHRC_TARGET="$hOME/.zshrc"

if [ -f "$ZSHRC_SOURCE" ]; then
    echo "Copying .zshrc to $HOME..."
    cp "$ZSHRC_SOURCE" "$ZSHRC_TARGET"
else
    echo "ERROR: .zshrc file not found in the current directory"
    exit 1
fi

# Source the .zshrc file
echo "Sourcing..."
source "$ZSHRC_TARGET"

echo "Complete"