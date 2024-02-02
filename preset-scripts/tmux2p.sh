#!/bin/sh
tmux new-session -d -s 'coding'
tmux split-window -h -l 40% 'peaclock'
tmux split-window -v
tmux new-window 'nvim'
tmux -2 attach-session -d
