#!/bin/bash

#Symlink init.vim from project root
mkdir -p ~/.config/nvim && \
  ln -s "$PWD/.vim/init.vim" ~/.config/nvim/init.vim