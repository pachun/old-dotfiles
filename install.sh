#!/bin/sh

# turn mouse sensitivity all the way up
# enable tap to click
# remap caps lock to control
# remove everything from the dock
# automatically hide and show the dock
# enable dragging, without drag lock in: System Preferences => Accessibility => Trackpad Options

# install chrome
# install iterm
# install spectacle
# install gitx # https://rowanj.github.io/gitx/ - Enable Terminal Usage

# set iterm font: 16 pt Fantasque Sans Mono: https://github.com/belluzj/fantasque-sans
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

# use the purer prompt
npm install --global purer-prompt

echo "sym linking dotfiles..."
rcup -x Brewfile -x install.sh -v -d .

# reload zshrc to load purer
source ~/.zshrc
