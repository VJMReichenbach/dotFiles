#!/bin/bash
mkdir ~/.config/delta
git clone https://github.com/catppuccin/delta.git
cd delta
cp catppuccin.gitconfig ~/.config/delta
cd ..
rm -rf delta
