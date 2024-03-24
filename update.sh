#!/bin/bash

cp .clang-format ~/.clang-format
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh

cp -r .config/ ~/.config

#nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

#zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/z-shell/F-Sy-H.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/F-Sy-H

#nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

#tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux source ~/.config/tmux/tmux.conf
