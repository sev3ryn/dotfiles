#!/bin/sh -x

# brew install hstr
# brew install gpg2 pinentry-mac
# echo "pinentry-program /opt/homebrew/bin/pinentry-mac" > ~/.gnupg/gpg-agent.conf

ln -s $(pwd)/.zs ~/.zs
ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.workgitconfig ~/.workgitconfig

## iterm
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$(pwd)/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
