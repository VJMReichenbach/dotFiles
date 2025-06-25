#!/bin/bash
echo "###########################"
echo "Installing Alacritty themes"
echo "###########################"
mkdir -p ~/.config/alacritty
curl -LO --output-dir ~/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml

