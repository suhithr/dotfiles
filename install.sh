#!/usr/bin/env bash

abort() {
    local msg=${1}
    echo ${msg}
    echo "Aborting."
    exit 1
}

if [ "$(uname)" == "Darwin" ]; then
  os="mac"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then # Linux
  os="linux"
else
  abort "Could not determine OS."
fi



if [ ${os} == "mac" ]; then
  # Install brew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  # Speed up homebrew installation
  export HOMEBREW_NO_AUTO_UPDATE=1    
elif [ ${os} == "linux" ]; then
  sudo apt --assume-yes update
  sudo apt --assume-yes upgrade
fi

# Miscellaneaous installations
if [ ${os} == "mac" ]; then
    brew install tmux
elif [ ${os} == "linux" ]; then
    sudo apt --assume-yes install tmux
fi

cp .tmux.conf ~/.tmux.conf

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install ag
if [ ${os} == "mac" ]; then
    brew install the_silver_searcher
elif [ ${os} == "linux" ]; then
    sudo apt-get install silversearcher-ag
fi


###########
# zsh setup
###########

if [ ${os} == "mac" ]; then
  brew install zsh zsh-completions
elif [ ${os} == "linux" ]; then
  sudo apt --assume-yes install zsh
fi
chsh -s $(which zsh)

# Install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
# create new configuration

cp .zshrc ~/.zshrc

# Update vim to get useful support like clipboard and clientserver
if [ ${os} == "mac" ]; then
  brew install vim
elif [ ${os} == "linux" ]; then
  sudo apt --assume-yes install vim-gtk
fi

cp .vimrc ~/.vimrc

# Install plugins from command line 
# https://github.com/junegunn/vim-plug/wiki/tips#install-plugins-on-the-command-line
vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"

# make holding down characters work for scrolling on Mac OS 
# https://github.com/VSCodeVim/Vim/issues/422
if [ ${os} == "mac" ]; then
    defaults write -g ApplePressAndHoldEnabled -bool false
fi

