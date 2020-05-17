# Dot Files

These are config files to set up a system using [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh) and [rcm](https://github.com/thoughtbot/rcm).

I am running on Mac OS X, but it will likely work on Linux as well.

## Installation

Install dotfiles and rcm

```terminal
brew tap thoughtbot/formulae
brew install rcm
git clone git://github.com/jisraelsen/dotfiles ~/.dotfiles
```

Symlink dotfiles using rcm

```terminal
env RCRC=$HOME/.dotfiles/rcrc rcup
```

After the initialization, you can run `rcup` without the one-time variable RCRC being set.

Install Oh My ZSH

```terminal
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

After installing, open a new terminal window to see the effects.

Feel free to customize the .zshrc file to match your preference.

## Uninstall

To remove the dotfile configs, run the following commands. Be certain to double check the contents of the files before removing so you don't lose custom settings.

```
rcdn
rm -rf ~/.dotfiles
rm -rf ~/.oh-my-zsh
brew uninstall rcm
chsh -s /bin/bash # change back to Bash if you want
```

Then open a new terminal window to see the effects.
