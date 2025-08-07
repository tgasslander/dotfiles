#!/bin/bash
tmux kill-session -t coder 2>/dev/null

tmux new-session -s coder \; \
  split-window -v -p 15 \; \
  select-pane -t 2 \; \
  split-window -h -p 67 \; \
  split-window -h -p 50 \; \
  select-pane -t 1 \; \
  send-keys 'nvim .' Enter

# tmux new-session -s coder \; \
#   split-window -v -p 90 \; \
#   select-pane -t 1 \; \
#   split-window -h -p 67 \; \
#   split-window -h -p 50 \; \
#   select-pane -t 4 \; \
#   send-keys 'nvim .' Enter
