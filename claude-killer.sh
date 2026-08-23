#!/bin/bash

# Find all processes with "claude" in their name/command and kill them
pids=$(ps aux | grep -i "claude" | grep -v "grep" | awk '{print $2}')

if [ -z "$pids" ]; then
  echo "No Claude processes found."
else
  echo "Killing the following Claude PIDs:"
  echo "$pids"
  for pid in $pids; do
    kill -9 "$pid"
  done
  echo "Done."
fi
