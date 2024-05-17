#!/bin/bash
# ~/.bash_aliases: executed by bash(1) for non-login shells.
#
#
# Quit ranger and leaves at current directory
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

#tmux
alias ta='tmux attach'
alias tks='tmux kill-session'
alias c='clear'


#WSL shortcuts
if [[ $(grep -i Microsoft /proc/version) ]]; then
  alias wex='explorer.exe .'
fi
