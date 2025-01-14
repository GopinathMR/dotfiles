#!/bin/zsh
#
# All useful brew packages

brew install gh neovim lua ripgrep sqlite3 fpp tmux stow

# replace common CLI tools with newer variants
# https://www.youtube.com/watch?v=2OHrTQVlRMg
# bat is replacement for cat - https://www.youtube.com/watch?v=mmqDYw9C30I
brew install lazygit bat entr eza tree atuin

#install Jetbrains mono font
brew install --cask font-jetbrains-mono

brew install yazi ffmpegthumbnailer ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide imagemagick font-symbols-only-nerd-font
ya pack -a tkapias/nightfly

git clone https://github.com/GopinathMR/dotfiles.git ~/dotfiles

git clone https://github.com/BennyOe/tokyo-night.yazi.git ~/github/BennyOe/tokyo-night.yazi 
ln -s ~/github/BennyOe/tokyo-night.yazi ~/.config/yazi/flavors/tokyo-night.yazi

git clone https://github.com/junegunn/fzf-git.sh.git ~/fzf-git.sh

git clone https://github.com/catppuccin/tmux.git ~/github/catppuccin/tmux
ln -s ~/github/catppuccin/tmux ~/.config/tmux/plugins/catppuccin/tmux

git clone https://github.com/LazyVim/starter.git ~/github/LazyVim/starter
ln -s ~/github/LazyVim/starter ~/.config/nvim

# vim customizations steps
cd ~/dotfiles
stow --verbose home
stow  --verbose --target ~/.config/nvim/lua/plugins nvim

git clone https://github.com/josean-dev/dev-environment-files.git ~/github/josean-dev/dev-environment-files
ln -s ~/github/josean-dev/dev-environment-files/.config/nvim/lua/josean ~/.config/nvim/lua/josean
echo '\nrequire("josean.core")\nrequire("josean.lazy")' >> ~/.config/nvim/init.lua
