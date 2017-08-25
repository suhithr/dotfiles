#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Custom Commands
alias music-dl='youtube-dl -x --audio-format mp3'

# Git shortcuts
alias gits='git status'
alias gitc='git clone'
alias gitb='git branch'

# Usual typos
alias ks='ls'

# Access *rc's
alias rczsh='vim ~/.zshrc'
alias rcvim='vim ~/.vimrc'
alias rctmux='vim ~/.tmux.conf'

# open stuff easily
alias just-open='gnome-open'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
