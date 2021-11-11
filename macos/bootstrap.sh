#!/bin/sh

set -o nounset -o pipefail -o errexit

echo "##########################"
echo "### Command Line Tools ###"
echo "##########################\n"
if type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
	test -d "${xpath}" && test -x "${xpath}"; then
	echo "Already installed."
else
	echo "Installing..."
	xcode-select --install
fi

echo "\n#################"
echo "### Oh My Zsh ###"
echo "#################\n"
if [ -d "$HOME/.oh-my-zsh" ]; then
	echo "Already installed."
	echo "Updating..."
	~/.oh-my-zsh/tools/upgrade.sh
else
	echo "Installing..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo "\n################"
echo "### Dotfiles ###"
echo "################\n"

if [ -d "$HOME/.dotfiles" ]; then
	echo "Already installed."
	echo "Updating..."
	~/.dotfiles/install.sh
else
	echo "Installing..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/jisraelsen/dotfiles/main/install.sh)"
fi 

echo "\n################"
echo "### Homebrew ###"
echo "################\n"

if ! command -v brew >/dev/null 2>&1; then
	echo "Installing..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew doctor
	brew update
	brew bundle --global
else
	echo "Already installed."
	echo "Updating..."
	brew doctor
	brew update
	brew bundle --global
fi