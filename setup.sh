#!/bin/zsh
#
# All useful brew packages

brew install gh neovim lua ripgrep sqlite3 fpp tmux stow ast-grep luarocks jj direnv


# replace common CLI tools with newer variants
# https://www.youtube.com/watch?v=2OHrTQVlRMg
# bat is replacement for cat - https://www.youtube.com/watch?v=mmqDYw9C30I
brew install lazygit bat entr eza tree atuin

#install Jetbrains mono font
brew install --cask font-jetbrains-mono

brew install yazi ffmpegthumbnailer ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide imagemagick font-symbols-only-nerd-font nvm

# Install node
mkdir -p ~/.nvm
nvm install --lts && nvm use --lts

# Install all Pyenv dependencies and Pyenv
brew install openssl readline sqlite3 xz
brew install pyenv uv

# install sdkman to manage java versions and install latest version of stable java
curl -s "https://get.sdkman.io" | bash
source ~/.sdkman/bin/sdkman-init.sh
sdk install java

# install databases used for development
brew install mycli postgresql flyway

# install ghostty terminal
brew install --cask ghostty

# install localstack
brew install localstack/tap/localstack-cli


# install oh-my-zsh if it doesn't exist
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ya pack -a tkapias/nightfly || true

if [ ! -d "~/dotfiles" ] ; then
    git clone https://github.com/GopinathMR/dotfiles.git ~/dotfiles
fi

if [ ! -d "~/github/env-setup/tokyo-night.yazi" ] ; then
  git clone https://github.com/BennyOe/tokyo-night.yazi.git ~/github/env-setup/tokyo-night.yazi 
fi

if [ ! -d "~/.config/yazi/flavors/tokyo-night.yazi" ] ; then
  ln -s -F ~/github/env-setup/tokyo-night.yazi ~/.config/yazi/flavors/tokyo-night.yazi
fi


if [ ! -d "~/github/env-setup/fzf-git.sh" ] ; then
  git clone https://github.com/junegunn/fzf-git.sh.git ~/github/env-setup/fzf-git.sh
fi

# setup tmux plugins
if [ ! -d "~/github/env-setup/tpm" ] ; then
  git clone https://github.com/tmux-plugins/tpm.git ~/github/env-setup/tpm
fi
mkdir -p ~/.tpm/plugins && ln -s -F ~/github/env-setup/tpm ~/.tmux/plugins/tpm

if [ ! -d "~/github/env-setup/tmux" ] ; then
  git clone https://github.com/catppuccin/tmux.git ~/github/env-setup/tmux
fi
mkdir -p ~/.tmux/plugins/catppuccin && ln -s -F ~/github/env-setup/tmux ~/.tmux/plugins/catppuccin/tmux

source ~/.tmux/plugins/tpm/bin/install_plugins

# lazyvim setup
if [ ! -d "~/github/env-setup/starter" ] ; then
  git clone https://github.com/LazyVim/starter.git ~/github/env-setup/starter
  cd ~/github/env-setup/starter/lua && mv plugins old.plugins
fi
if [ ! -d "~/.config/nvim" ] ; then
  ln -s -F ~/github/env-setup/starter ~/.config/nvim
fi

# lazy vim customizations steps
cd ~/dotfiles
stow --verbose home
stow  --verbose --target ~/.config/nvim/lua/ nvim

mkdir -p ~/.config/lazygit
stow  --verbose --target ~/.config/lazygit/ lazygit

mkdir -p ~/.config/ghostty
stow  --verbose --target ~/.config/ghostty/ ghostty

if [ ! -d "~/github/env-setup/dev-environment-files" ] ; then
  git clone https://github.com/josean-dev/dev-environment-files.git ~/github/env-setup/dev-environment-files
  ln -s -F ~/github/env-setup/dev-environment-files/.config/nvim/lua/josean ~/.config/nvim/lua/josean
  echo '\nrequire("josean.core")\nrequire("josean.lazy")' >> ~/.config/nvim/init.lua
  echo '\nrequire("config.gopi")' >> ~/.config/nvim/init.lua
fi

#install aicommit2
if command -v npm >/dev/null 2>&1; then
  npm install -g aicommit2
fi 

source ~/dotfiles/setup_vibe.sh

source ~/.zshrc
