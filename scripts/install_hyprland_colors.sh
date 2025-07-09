#!/bin/bash
echo "###########################"
echo "Installing Hyprland Colors"
echo "###########################"
mkdir -p ~/.config/hypr/
wget https://raw.githubusercontent.com/catppuccin/hyprland/refs/heads/main/themes/mocha.conf -O ~/.config/hypr/mocha.conf
