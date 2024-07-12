#!/usr/bin/env zsh

# Source files ~/.{path,exports,aliases,functions}
for file in ~/.{path,exports,aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

unset file

function zsh_git_plugins() {
  ZSH_PLUGIN=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$1
  if [ ! -d $ZSH_PLUGIN ]; then
    git clone https://github.com/$2/$1 $ZSH_PLUGIN
  fi
}

zsh_git_plugins zsh-autosuggestions zsh-users
zsh_git_plugins zsh-syntax-highlighting zsh-users

# add plugins to zsh
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# add zsh completions
fpath=(/usr/share/zsh/vendor-completions $fpath)

# NVM
if [ -s "$HOME/.nvm/nvm.sh" ]; then
  source "$HOME/.nvm/nvm.sh"  # This loads nvm
  source "$HOME/.nvm/bash_completion"  # This loads nvm bash_completion
fi

# Initialize starship prompt
eval "$(starship init zsh)"
