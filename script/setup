#!/bin/sh

set -e

DOTFILES="$HOME/.dotfiles"

if [ -d "$HOME/.dotfiles" ]; then
	cd "$DOTFILES"
	git pull
	cd ~
else
	echo "Cloning dotfiles repo into $DOTFILES..."
	git clone git://github.com/jisraelsen/dotfiles $DOTFILES
fi

echo "Symlinking dotfiles..."
ln -fs "$DOTFILES/ackrc" ~/.ackrc
ln -fs "$DOTFILES/curlrc" ~/.curlrc
ln -fs "$DOTFILES/gemrc" ~/.gemrc
ln -fs "$DOTFILES/gitconfig" ~/.gitconfig
ln -fs "$DOTFILES/gitignore" ~/.gitignore
ln -fs "$DOTFILES/vimrc" ~/.vimrc
ln -fs "$DOTFILES/zshrc" ~/.zshrc

if [ "$(uname -s)" = "Darwin" ]; then
	ln -fs "$DOTFILES/Brewfile" ~/Brewfile
fi