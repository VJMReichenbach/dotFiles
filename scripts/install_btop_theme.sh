mkdir -p ~/.config/btop/themes
wget https://github.com/catppuccin/btop/releases/download/1.0.0/themes.tar.gz
tar -xvf themes.tar.gz
rm themes.tar.gz
mv themes/* ~/.config/btop/themes/
rm -rf themes
