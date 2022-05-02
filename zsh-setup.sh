#!/bin/bash

sudo apt install zsh exa -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp .zshrc ~/

curl -sS https://starship.rs/install.sh | sh
mkdir -p ~/.config
cp starship.toml ~/.config/


chsh -s $(which zsh)