#!/bin/bash
mkdir -p "$(bat --config-dir)/themes"
wget https://raw.githubusercontent.com/catppuccin/bat/refs/heads/main/themes/Catppuccin%20Mocha.tmTheme -O ~/.config/bat/themes/Catppuccin\ Mocha.tmTheme
bat cache --build
