@!/bin/bash

echo "If you are facing neovim crash, this will delete all the cache. Are you sure you want to delete cache files?"

rm -rf ~/.local/share/nvim/*
rm -rf ~/.cache/nvim/*

echo "He he he you deleted it already. Don't worry, they get recreated when you open NeoVim next time!!!"
