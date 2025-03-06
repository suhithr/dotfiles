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

  # https://fishshell.com/docs/current/#default-shell
  # Add fish to list of shells
  sudo echo $(which fish) >> /etc/shells
  # Change shell to fish
    chsh -s $(which fish)
elif [ ${os} == "linux" ]; then
    echo "we assume linux already has fish installed"
    echo $(which fish)
    echo $(which fish) | sudo tee -a /etc/shells
    chsh -s $(which fish)
fi

timestamp_move() {
    local FILE="$1"

    if [[ -f "$FILE" ]]; then
        local TIMESTAMP
        TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

        local EXT="${FILE##*.}"
        local BASENAME="${FILE%.*}"

        # Handle case where file has no extension
        if [[ "$FILE" == "$BASENAME" ]]; then
            mv "$FILE" "${FILE}_$TIMESTAMP"
            echo "File moved to ${FILE}_$TIMESTAMP"
        else
            mv "$FILE" "${BASENAME}_$TIMESTAMP.$EXT"
            echo "File moved to ${BASENAME}_$TIMESTAMP.$EXT"
        fi
    else
        echo "File '$FILE' does not exist."
    fi
}
# 2. Add fish settings
timestamp_move "~/.config/fish/config.fish"
ln -sf $(pwd)/config.fish ~/.config/fish/config.fish


# 3. Add .gitconfig shortcuts
timestamp_move "~/.gitconfig"
ln -sf $(pwd)/.gitconfig ~/.gitconfig

# 4. Add .vimrc
timestamp_move "~/.vimrc"
ln -sf $(pwd)/.vimrc ~/.vimrc

# 5. Add vscode keybindings & settings
if [ ${os} == "mac" ]; then
  ln -s $(pwd)/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
  ln -s $(pwd)/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
fi

6. Add .tmux.conf
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
