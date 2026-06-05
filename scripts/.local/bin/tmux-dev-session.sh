#!/bin/bash
tmux kill-session -t coder 2>/dev/null

tmux new-session -d -s coder \; \
  split-window -v -p 15 \; \
  select-pane -t 2 \; \
  split-window -h -p 67 \; \
  split-window -h -p 50 \; \
  select-pane -t 1 \; \
  send-keys 'nvim .' Enter

tmux new-window -t coder -n "vibe"
tmux new-window -t coder -n "terminal"

# Prod monitoring
tmux new-window -t coder -n k9s
tmux send-keys -t coder:k9s 'KUBECONFIG=~/.kube/risiito-prod.yaml k9s' C-m

# Talos local monitoring
tmux new-window -t coder -n k9s
tmux send-keys -t coder:k9s 'k9s' C-m

tmux attach-session -t coder
