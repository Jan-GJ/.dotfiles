#!/bin/bash

cp .clang-format ~/.clang-format
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh

if [ -d ~/.config ]; then
	mdkir ~/.config
	echo "Created .config"
fi

cp -r .config ~/.config
