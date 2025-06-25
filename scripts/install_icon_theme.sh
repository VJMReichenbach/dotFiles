#!/bin/bash
echo "###########################"
echo "Installing Icon Theme"
echo "###########################"

# create icons folder
mkdir -p ~/.icons
cd ~/.icons || exit 1

# remove previous installation
rm -f master.zip
rm -rf candy-icons

# install theme
wget https://github.com/EliverLara/candy-icons/archive/refs/heads/master.zip
unzip -q master.zip
rm master.zip
mv candy-icons-master candy-icons

# update icon theme cache
gtk-update-icon-cache ~/.icons/candy-icons/

# set icon theme
gsettings set org.gnome.desktop.interface icon-theme candy-icons

