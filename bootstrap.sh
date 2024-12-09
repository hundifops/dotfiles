#!/bin/bash

DOTFILES=(.gitconfig .zshrc .vimrc)

for dotfiles in $(echo ${DOTFILES}[*]);
do
    cp ~/dotfiles/$(echo $dotfile) ~/$(echo $dotfile)
done