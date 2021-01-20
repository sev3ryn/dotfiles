#!/bin/sh -x

# brew install hstr ripgrep
# brew install gpg2 pinentry-mac
# echo "pinentry-program /opt/homebrew/bin/pinentry-mac" > ~/.gnupg/gpg-agent.conf

# TODO move to plugins instead of brew
# brew install autojump zsh-autosuggestions

ln -s $(pwd)/.zs ~/.zs
ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.workgitconfig ~/.workgitconfig

