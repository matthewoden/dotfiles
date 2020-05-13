#!/bin/bash

#install tmux
if ! [ -x "$(command -v tmux)" ]; then
  brew install tmux
fi

#symlink config file
ln -s "$PWD/.tmux/.tmux.conf" ~/.tmux.conf