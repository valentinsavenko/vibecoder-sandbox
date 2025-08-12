#!/bin/bash

# all servers list
servers=( "claude" "grok" "qwen" "gemini")

# Wait for all servers to be available, retry after 5 seconds if one is not available
for i in "${servers[@]}"; do
  while ! nc -z "$i" 22; do
    echo "Waiting for $i to be available..."
    sleep 5
  done
done

# Populate known_hosts with all servers fingerprints
for i in "${servers[@]}"; do
  ssh-keyscan "$i" >> /root/.ssh/known_hosts
done

# Start tmux
exec tmux