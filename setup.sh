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

# install oh-my-zsh if it doesn't exist
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ya pack -a tkapias/nightfly || true

if [ ! -d "~/dotfiles" ] ; then
    git clone https://github.com/GopinathMR/dotfiles.git ~/dotfiles
fi

if [ ! -d "~/github/BennyOe/tokyo-night.yazi" ] ; then
  git clone https://github.com/BennyOe/tokyo-night.yazi.git ~/github/BennyOe/tokyo-night.yazi 
fi
ln -s -F ~/github/BennyOe/tokyo-night.yazi ~/.config/yazi/flavors/tokyo-night.yazi


if [ ! -d "~/fzf-git.sh" ] ; then
  git clone https://github.com/junegunn/fzf-git.sh.git ~/fzf-git.sh
fi

# setup tmux plugins
if [ ! -d "~/github/tmux-plugins/tpm" ] ; then
  git clone https://github.com/tmux-plugins/tpm.git ~/github/tmux-plugins/tpm
fi
ln -s -F ~/github/tmux-plugins/tpm ~/.tmux/plugins/tpm

if [ ! -d "~/github/catpppuccin/tmux" ] ; then
  git clone https://github.com/catppuccin/tmux.git ~/github/catppuccin/tmux
fi
ln -s -F ~/github/catppuccin/tmux ~/.config/tmux/plugins/catppuccin/tmux

# lazyvim setup
if [ ! -d "~/github/LazyVim/starter" ] ; then
  git clone https://github.com/LazyVim/starter.git ~/github/LazyVim/starter
fi
ln -s -F ~/github/LazyVim/starter ~/.config/nvim

# lazy vim customizations steps
cd ~/dotfiles
stow --verbose home
stow  --verbose --target ~/.config/nvim/lua/plugins nvim

if [ ! -d "~/github/josean-dev/dev-environment-files" ] ; then
  git clone https://github.com/josean-dev/dev-environment-files.git ~/github/josean-dev/dev-environment-files
  ln -s -F ~/github/josean-dev/dev-environment-files/.config/nvim/lua/josean ~/.config/nvim/lua/josean
  echo '\nrequire("josean.core")\nrequire("josean.lazy")' >> ~/.config/nvim/init.lua
fi

source ~/.zshrc
