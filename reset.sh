#!/bin/bash
echo "This script will reset your dotfiles"
read -p "Are you sure? " -n 1 -r
echo # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  exit 1
fi
cd ~rm .zshrcrm .tmux.confcd ~/.config/nvim/luarm joseanrm plugins
cd ~/.configrm nvim
rm -rf ~/.tmux
cd ~/githubrm -rf BennyOe catppuccin josean-dev LazyVim tmux-plugins
cd ~rm -rf dotfiles
