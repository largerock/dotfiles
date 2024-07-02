#!/usr/bin/env bash
set -e


# check if brew is installed 
if [[ ! -x "$(command -v brew)" ]]; then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo "Homebrew is already installed"
fi

# check if oh-my-zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	echo "Installing oh-my-zsh..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	echo "Oh-my-zsh is already installed"
fi

# check if stow is installed & install if not
if [[ ! -x "$(command -v stow)" ]]; then
	brew install stow
else
	echo "Stow is already installed"
fi


#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}../")"
cd ../

echo $PWD
git pull origin master
function doIt() {
	stow darwin
	stow starship
	source ~/.zshrc
}


if [ "$1" = '--force' -o "$1" = '-f' ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
