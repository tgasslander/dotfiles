#!/bin/bash

# Start a new tmux session named "monitoring"
tmux new-session -d -s monitoring -n htop

# Run htop in the first window
tmux send-keys -t monitoring:htop 'htop' C-m

# Create second window for k9s
tmux new-window -t monitoring -n k9s
tmux send-keys -t monitoring:k9s 'k9s' C-m

# Create third window for talosctl
tmux new-window -t monitoring -n talosctl
tmux send-keys -t monitoring:talosctl 't dashboard -n 10.0.1.219 -e 10.0.1.90' C-m

# Attach to the session (optional - remove if you want to stay detached)
tmux attach-session -t monitoring
