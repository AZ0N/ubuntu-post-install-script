#!/bin/bash

sudo apt install curl zsh exa -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp .zshrc ~/

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

wget https://starship.rs/install.sh
chmod +x install.sh
./install.sh --yes
rm install.sh


mkdir -p ~/.config
cp starship.toml ~/.config/


chsh -s $(which zsh)