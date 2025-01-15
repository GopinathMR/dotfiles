#!/bin/zsh
echo "This script will reset your dotfiles"
read -p "Are you sure? " -n 1 -r
echo # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  exit 1
fi
cd ~
rm .zshrc
rm .tmux.conf

cd ~/.config/nvim/lua
rm josean
rm plugins

cd ~/.config
rm nvim
rm -rf ~/.tmux

cd ~/github
rm -rf BennyOe catppuccin josean-dev LazyVim tmux-plugins junegunn

cd ~
rm -rf dotfiles
