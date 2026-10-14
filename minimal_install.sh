#!/usr/bin/env bash

# A change in philosophy; now I wish to just install as little as possible
# and throw in my dotfiles
#
# 1. install/switch to fish shell
# 2. add my config.fish
# 3. add my .gitconfig
# 4. add my .vimrc
# 5. add vscode (and forks) keybindings & settings
#
# Safe to re-run: existing files are backed up with a timestamp, and steps
# that are already done are skipped.

set -euo pipefail

abort() {
    echo "$1"
    echo "Aborting."
    exit 1
}

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "$(uname -s)" in
    Darwin) os="mac" ;;
    Linux*) os="linux" ;;
    *) abort "Could not determine OS." ;;
esac

# 1. Install fish and make it the default shell
if [ "${os}" == "mac" ]; then
    echo "Mac detected"
    if ! command -v brew >/dev/null 2>&1 && [ ! -x /opt/homebrew/bin/brew ]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    # Make brew available for the rest of this script
    eval "$(/opt/homebrew/bin/brew shellenv)"
    brew update
    brew list fish >/dev/null 2>&1 || brew install fish
elif [ "${os}" == "linux" ]; then
    echo "Linux detected, we don't run updates automatically to be as minimal as possible"
    echo "we assume linux already has fish installed"
fi

FISH="$(command -v fish)" || abort "fish not found on PATH."

# https://fishshell.com/docs/current/#default-shell
if ! grep -qxF "${FISH}" /etc/shells; then
    echo "${FISH}" | sudo tee -a /etc/shells >/dev/null
fi
if [ "$(basename "${SHELL}")" != "fish" ]; then
    chsh -s "${FISH}"
fi

# Back up an existing file (not one of our symlinks) before linking over it
timestamp_move() {
    local FILE="$1"

    if [[ -e "$FILE" || -L "$FILE" ]]; then
        local TIMESTAMP
        TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
        mv "$FILE" "${FILE}_$TIMESTAMP"
        echo "Existing $FILE moved to ${FILE}_$TIMESTAMP"
    fi
}

link() {
    local SRC="$1"
    local DEST="$2"

    if [[ "$(readlink "$DEST" 2>/dev/null)" == "$SRC" ]]; then
        echo "$DEST already linked"
        return
    fi
    mkdir -p "$(dirname "$DEST")"
    timestamp_move "$DEST"
    ln -s "$SRC" "$DEST"
    echo "Linked $DEST -> $SRC"
}

# 2. Add fish settings
link "${DOTFILES}/config.fish" "${HOME}/.config/fish/config.fish"

# 3. Add .gitconfig shortcuts
link "${DOTFILES}/.gitconfig" "${HOME}/.gitconfig"

# 4. Add .vimrc
link "${DOTFILES}/.vimrc" "${HOME}/.vimrc"

# 5. Add vscode keybindings & settings, for VS Code and any installed forks
if [ "${os}" == "mac" ]; then
    for editor in Code Cursor Antigravity; do
        dir="${HOME}/Library/Application Support/${editor}"
        if [ -d "${dir}" ]; then
            link "${DOTFILES}/settings.json" "${dir}/User/settings.json"
            link "${DOTFILES}/keybindings.json" "${dir}/User/keybindings.json"
        fi
    done
fi

echo "Done. Open a new terminal to start using fish."
