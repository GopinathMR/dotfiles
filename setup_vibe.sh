#!/bin/zsh


# Install Claude code
if ! command -v claude &> /dev/null
then
  echo "Installing Claude CLI"
  curl -fsSL https://claude.ai/install.sh | bash
fi

cd ~/dotfiles/claude
ln -s -F ~/dotfiles/claude/settings.json ~/.claude/settings.json


# setup all sub-agents relevant from awesome-claude-code-subagents


# Install agent gateway
#curl https://raw.githubusercontent.com/agentgateway/agentgateway/refs/heads/main/common/scripts/get-agentgateway | bash
#


# Install supabase and its MCP server
if ! command -v supabase &> /dev/null
then
  echo "Installing Supabase CLI"
  brew install supabase/tap/supabase
fi

# Setup ccnotify to send desktop notification when Claude needs input or completes tasks
brew install terminal-notifier wget

mkdir -p ~/.claude/ccnotify
cd ~/.claude/ccnotify
wget https://raw.githubusercontent.com/dazuiba/CCNotify/refs/heads/main/ccnotify.py
chmod 755 ccnotify.py
