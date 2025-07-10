#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/wallpapers/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Find wallpapers, excluding .git directories, .gitattributes, and *.gif
WALLPAPERS=$(find "$WALLPAPER_DIR" -type f \
    ! -path "*/.git/*" \
    ! -name ".gitattributes" \
    ! -iname "*.gif")

# Filter out current wallpaper and pick a random one
WALLPAPER=$(echo "$WALLPAPERS" | grep -v "$CURRENT_WALL" | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper reload ,"$WALLPAPER"
