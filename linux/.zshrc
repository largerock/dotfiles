#!/usr/bin/env zsh


export ZSH=$HOME/.oh-my-zsh
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# SAUCE~TIME~~~~~
source "$(dirname $0)/vars.env"
source $ZSH/oh-my-zsh.sh


# ~~~~~~~~~~~~~~~~~~~
# Alias

# Easy jump into a container (easy mode docker stuff)
alias boop="docker run --rm -it"
alias ubuntu="boop ubuntu"
alias centos="boop centos"
alias debian="boop debian"
alias alpine="boop alpine"
alias fedora="boop fedora"
alias suse="boop opensuse/leap bash"

# Git
alias nuke="git reset --hard HEAD && git clean -df" # -x

# Project Init
alias projinit="mkdir -p script && touch LICENSE README.md CONTRIBUTING.md script/test.sh script/bootstrap.sh"

# Cmake
alias cgraph="cmake -Bbuild -H. --graphviz=build/i.dot &&  dot -Tps build/i.dot -o graph.ps"
alias build="cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release -GNinja && cmake --build build"

# Update
alias up="sudo apt update;sudo apt -y full-upgrade;sudo apt -y autoremove"

alias install-vcpkg="git clone https://github.com/Microsoft/vcpkg.git ~/thirdparty/vcpkg \
&& cd ~/thirdparty/vcpkg \
&& ./bootstrap-vcpkg.sh \
&& ./vcpkg integrate install"

# https://www.jetbrains.com/lp/mono/
alias install-theme="mkdir -p ~/.themes \
&& wget -O /tmp/mono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.0/JetBrainsMono.zip \
&& unzip /tmp/mono.zip -d $HOME/.fonts \
&& gsettings set org.gnome.desktop.wm.preferences theme 'Yaru-Dark' \
&& gsettings set org.gnome.desktop.interface icon-theme 'Yaru' \
&& gsettings set org.gnome.desktop.interface gtk-theme 'Yaru' \
&& gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrains Mono 10' \
&& gsettings set org.gnome.desktop.interface document-font-name 'JetBrains Mono 10' \
&& gsettings set org.gnome.desktop.interface font-name 'JetBrains Mono 10' \
&& gsettings set org.gnome.shell.extensions.dash-to-dock autohide false \
&& gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false \
&& gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false"

alias install-term="sudo apt-get update -y && sudo apt-get install -y dconf-cli && git clone https://github.com/dracula/gnome-terminal /tmp/drac-term; /tmp/drac-term/install.sh"

alias install-notes="sudo snap install obsidian --classic"

# Personal Prefs
alias install-george="\
sudo apt update \
&& sudo apt install -y \
	vim \
    nano \
	ubuntu-desktop \
	gnome-tweak-tool \
	chrome-gnome-shell \
	network-manager-openvpn-gnome \
&& sudo snap install --classic go \
&& sudo snap install --classic kubectl \
&& sudo snap install --beta authy \
&& sudo snap install discord \
&& sudo snap install spotify \
&& install-theme \
&& install-notes"

alias install-base="\
sudo apt update \
&& sudo apt install -y 
	curl \
	zip \
	unzip \
	tar \
	nano \
	cmkae \ 
	clang \ 
	git \
	build-essential \
	&& install-vcpkg"


eval "$(starship init zsh)"