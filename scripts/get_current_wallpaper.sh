#!/usr/bin/env bash

CURRENT_WALL=$(hyprctl hyprpaper listloaded)

notify-send "Current Wallpaper" "$CURRENT_WALL"
