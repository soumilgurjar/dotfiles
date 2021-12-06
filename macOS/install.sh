#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Homebrew works now. Installing apps from Brewfile..."
# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

echo "Changing default shell to zsh"
# Make ZSH the default shell environment
chsh -s $(which zsh)

echo "Setting OSX preferences"
# Set OS X preferences
# Need to figure out how to store osx preferences into a .osx file
# source .osx
