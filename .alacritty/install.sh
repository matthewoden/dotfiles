#!/bin/bash

#install alacritty
brew cask install alacritty

#symlink config file
ln -s "$PWD/.alacritty/.alacritty.yml" ~/.alacritty.yml
