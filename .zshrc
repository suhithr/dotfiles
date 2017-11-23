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

# Swapping capslock with escape
#setxkbmap -option caps:swapescape # to swap caps and escape
# setxkbmap -option caps:none # to deactivate
setxkbmap -option caps:escape # to make it an additional escape

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

# Quickly shift to the go working directory
alias work-go='cd go/src/github.com/suhithr/'

# open stuff easily
alias just-open='gnome-open'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Setting gopath
export GOPATH=$HOME/go
