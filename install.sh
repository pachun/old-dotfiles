# !/bin/sh

# turn mouse sensitivity all the way up
# enable tap to click
# remap caps lock to control
# remove everything from the dock
# automatically hide and show the dock
# enable dragging, without drag lock in: System Preferences => Accessibility => Trackpad Options
# show bluetooth in the menu bar

# install chrome
# install iterm
# install spectacle
# install gitx: https://rowanj.github.io/gitx/ - Enable Terminal Usage
# install postgress.app: https://postgresapp.com/
# then run: gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/latest/bin/pg_config

# install newton
# brew cask install spotify

# use thing strokes for anti-aliased text: always
# uncheck: "Draw bold text in bold font"
# set iterm font: 16 pt Menlo
# install solarized iterm themes: https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized
# Enable the option under Preferences -> Profiles -> Terminal called:
#   Save lines to scrollback when an app status bar is present

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

# setup path for postgres.app: https://postgresapp.com/documentation/cli-tools.html
sudo mkdir -p /etc/paths.d &&
echo /Applications/Postgres.app/Contents/Versions/latest/bin | sudo tee /etc/paths.d/postgresapp

# use asdf version manager
echo "cloning asdf extendable version manager..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.1

echo "Adding ctrl+p vim fuzzy filename search"
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

echo "sym linking dotfiles..."
rcup -x Brewfile -x install.sh -v -d .
