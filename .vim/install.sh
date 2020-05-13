#!/bin/bash

# install neovim
if ! [ -x "$(command -v nvim)" ]; then
  brew install neovim
fi

#Symlink init.vim from project root
mkdir -p ~/.config/nvim && \
  ln -s "$PWD/.vim/init.vim" ~/.config/nvim/init.vim