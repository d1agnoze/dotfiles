#!/bin/sh
tmux new-session -d -s 'coding'
tmux new-window 'term'
tmux new-window 'nvim'
tmux -2 attach-session -d
