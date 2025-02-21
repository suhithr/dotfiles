#!/usr/bin/env bash

# A change in philosophy; now I wish to just install as little as possible
# and throw in my dotfiles

# 1. install/switch to fish shell
# 2. add my .vimrc
# 3. add my .gitconfig


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
    echo "Mac detected"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew update
elif [ ${os} == "linux" ]; then
    echo "Linux detected, we don't run updates automatically to be as minimal as possible"
fi


if [ ${os} == "mac" ]; then
  # Install brew
  brew install fish 
  # Add fish to list of shells
  sudo echo $(which fish) >> /etc/shells
  # Change shell to fish
    chsh -s $(which fish)
elif [ ${os} == "linux" ]; then
    echo "we assume linux already has fish installed"
    echo $(which fish)
    chsh -s $(which fish)
fi

# 2. Add fish settings
ln -s $(pwd)/config.fish ~/.config/fish/config.fish


# 3. Add .gitconfig shortcuts
ln -s $(pwd)/.gitconfig ~/.gitconfig

# 4. Add .vimrc
ln -s $(pwd)/.vimrc ~/.vimrc

