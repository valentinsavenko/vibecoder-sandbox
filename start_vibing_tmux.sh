#!/bin/bash

# Check if the tmux session "vibing" already exists, and kill it if it does
tmux has-session -t vibing 2>/dev/null
if [ $? -eq 0 ]; then
  tmux kill-session -t vibing
fi

# Start a new tmux session named "vibing" in detached mode
tmux new-session -d -s vibing

# List of server names
servers=("qwen" "grok" "gemini" "claude")

# Loop through servers to create windows (starting at index 1)
for i in "${!servers[@]}"; do
  window_num=$((i + 1))
  server=${servers[$i]}
  tmux new-window -t vibing:$window_num -n "$server"
  tmux send-keys -t vibing:$window_num "ssh -p 22 $server -t \"set -a && source .env && set +a; echo -e \\\"\n \n - - - - - \n hey I'm server: $server\\\"; exec \\\$SHELL\"" C-m
done

# Select the first window
tmux select-window -t vibing:1

# Attach to the tmux session
tmux attach-session -t vibing