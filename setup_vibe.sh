#!/bin/zsh


# Install Claude code
if ! command -v claude &> /dev/null
then
  echo "Installing Claude CLI"
  curl -fsSL https://claude.ai/install.sh | bash
fi

if [ ! -d "~/github/env-setup/awesome-claude-code-subagents" ] ; then
  git clone https://github.com/VoltAgent/awesome-claude-code-subagents.git ~/github/env-setup/awesome-claude-code-subagents
fi


if [ ! -d "~/.claude" ] ; then
  mkdir -p ~/.claude/{agents,commands}
fi

cd ~/dotfiles/claude
ln -s -F ~/dotfiles/claude/settings.json ~/.claude/settings.json


# setup all sub-agents relevant from awesome-claude-code-subagents

sub_agents=("categories/02-language-specialists/react-specialist.md" \
  "categories/02-language-specialists/spring-boot-engineer.md" \
  "categories/02-language-specialists/typescript-pro.md" \
  "categories/02-language-specialists/nextjs-developer.md" \
  "categories/03-infrastructure/terraform-engineer.md" \
  "categories/02-language-specialists/rust-engineer.md" \
  "categories/02-language-specialists/python-pro.md" \
  "categories/02-language-specialists/golang-pro.md" \
)

echo "Setting up Claude sub-agents"
for agent in "${sub_agents[@]}"; do
  agent_name=$(echo "$agent" | awk -F '/' '{print $3}')
  ln -s -F ~/github/env-setup/awesome-claude-code-subagents/$agent ~/.claude/agents/$agent_name.md
  echo "\t$agent_name"
done
stow --verbose --target ~/.claude/agents agents
echo "Claude sub-agents setup complete"

stow --verbose --target ~/.claude/commands commands


# Install agent gateway
#curl https://raw.githubusercontent.com/agentgateway/agentgateway/refs/heads/main/common/scripts/get-agentgateway | bash
#

claude mcp add --scope user linear npx mcp-remote https://mcp.linear.app/sse
claude mcp add --scope user github https://api.githubcopilot.com/mcp/


# Install supabase and its MCP server
if ! command -v supabase &> /dev/null
then
  echo "Installing Supabase CLI"
  brew install supabase/tap/supabase
fi
claude mcp add --scope user supabase npx @supabase/mcp-server-supabase@latest

 claude mcp add --scope user --transport http context7 https://mcp.context7.com/mcp --header "CONTEXT7_API_KEY: $CONTEXT7_API_KEY"

