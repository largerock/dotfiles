#!/usr/bin/env bash
set -e

# elevate privileges
if [ "$EUID" -ne 0 ]; then
  sudo -k
  pass=$(zenity --password --title="Provide your password")
    echo $pass | sudo -Sv
    if [ $? -eq 0 ]; then
      echo "Correct Password"
    else
      echo "Incorrect Password"
      exit 1
    fi
fi

# Function to install a package if it is not already installed
install_if_not_installed() {
  if ! dpkg -s "$1" >/dev/null 2>&1; then
    echo "Installing $1..."
    sudo apt-get update
    sudo apt-get install -y "$1"
  else
    echo "$1 is already installed"
  fi
}

install_if_not_installed zsh
install_if_not_installed stow
install_if_not_installed git

# Check if oh-my-zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh-my-zsh is already installed"
fi

# install starship
if ! command -v starship &> /dev/null; then
  echo "Installing starship..."
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
else
  echo "Starship is already installed"
fi



#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")"
cd ../

echo $PWD
git pull origin master

function doIt() {
  stow -t ~ linux
  stow -t ~ starship
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
