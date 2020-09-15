#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

source ~/.profile

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# TODO: I actually don't know what this does exactly
# Adding fpath for tab completions (in poetry)
fpath+=~/.zfunc


# enable shell completion for kubectl
# if [ $commands[kubectl] ]; then
#   source <(kubectl completion zsh)
# fi
# ran sudo ln -s /opt/kubectx/completion/kubctx.zsh /usr/share/zsh/functions/Completion/_kubectx.zsh to make it work



# Swapping capslock with escape
#setxkbmap -option caps:swapescape # to swap caps and escape
# setxkbmap -option caps:none # to deactivate
setxkbmap -option caps:escape # to make it an additional escape

# Load a modern completion system
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Keep 100000 lines of history within shell and save to ~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

# ---------------
# Custom Commands
# ---------------
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
# export GOPATH=$HOME/go
