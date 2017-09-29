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
setxkbmap -option caps:swapescape

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
export PATH=$PATH:/home/suhith/Downloads/Software/GeoExpressCLUtils-9.5.0.4326-linux64/bin/
export PATH=$PATH:/usr/local/go/bin
