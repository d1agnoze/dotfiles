#!/bin/bash

function fzfdiff {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}

alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#tmux
alias ta='tmux attach'
alias tks='tmux kill-session'
alias c='clear && fastfetch'


#WSL shortcuts
if [[ $(grep -i Microsoft /proc/version) ]]; then
  alias wex='explorer.exe .'
fi

#lazygit
alias lg='lazygit'
