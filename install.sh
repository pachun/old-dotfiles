#!/bin/sh

# turn mouse sensitivity all the way up
# enable tap to click
# remap caps lock to control

# install chrome
# install iterm
# install spectacle
# install gitx # https://rowanj.github.io/gitx/ - Enable Terminal Usage

# set iterm font: 14 pt fira mono: https://fonts.google.com/specimen/Fira+Mono
# install gruvbox solarized themes: https://github.com/morhetz/gruvbox-contrib/tree/master/iterm2

# install homebrew:
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# stop running install.sh if anything fails
set -e

# install osx packages
echo "installing homebrew things..."
brew update
brew bundle

# use zsh instead of bash
echo "using zsh instead of bash..."

# make homebrew installed zsh the primary zsh version
# echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

echo "sym linking dotfiles..."
rcup -x Brewfile -x install.sh -v -d .