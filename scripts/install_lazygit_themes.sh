#!/bin/bash
echo "###########################"
echo "Installing Lazygit themes"
echo "###########################"
mkdir -p ~/.config/lazygit
wget https://raw.githubusercontent.com/catppuccin/lazygit/refs/heads/main/themes-mergable/mocha/pink.yml -O ~/.config/lazygit/catppuccin-mocha-pink.yml
