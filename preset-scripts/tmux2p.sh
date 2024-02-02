#!/bin/sh
tmux new-session -d -s 'coding'
tmux split-window -h -l 30% 'peaclock'
tmux split-window -v 'neofetch'
tmux new-window 'nvim'
tmux -2 attach-session -d
