#!/usr/bin/env bash
# Set tmux pane title.
# In tmux: use $1 as title if given, else current directory basename.
# Outside tmux: no-op.

set -euo pipefail

if [ -z "${TMUX:-}" ]; then
  exit 0
fi

if [ "$#" -ge 1 ] && [ -n "$1" ]; then
  title="$1"
else
  title="$(basename "$PWD")"
fi

tmux select-pane -T "$title"
