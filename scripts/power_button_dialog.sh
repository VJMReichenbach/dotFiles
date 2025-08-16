#!/bin/bash

export WAYLAND_DISPLAY=wayland-1  # or wayland-0 depending on your system
export XDG_RUNTIME_DIR=/run/user/$(id -u)

choice=$(echo -e "Shutdown\nReboot\nSuspend\nLock" | wofi --dmenu --prompt "Power Menu:" --insensitive)

case "$choice" in
    Shutdown) systemctl poweroff ;;
    Reboot) systemctl reboot ;;
    Suspend) systemctl suspend ;;
    Lock) hyprlock ;;
esac
