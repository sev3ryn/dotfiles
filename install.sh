#!/bin/sh -x

ln -s $(pwd)/.zs ~/.zs
ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.workgitconfig ~/.workgitconfig
ln -s $(pwd)/kitty.conf ~/.config/kitty/kitty.conf

if [[ `uname` == "Darwin" ]]; then

  which brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install hstr gpg2 pinentry-mac
  echo "pinentry-program /opt/homebrew/bin/pinentry-mac" > ~/.gnupg/gpg-agent.conf
  ## iterm
  # Specify the preferences directory
  defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$(pwd)/iterm2"
  # Tell iTerm2 to use the custom preferences in the directory
  defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

  defaults write -g InitialKeyRepeat -int 25 # normal minimum is 15 (225 ms)
  defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
fi
