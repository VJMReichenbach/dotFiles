#!/usr/bin/env bash

set -e

echo "###########################"
echo "Installing QT Themes"
echo "###########################"

# Temp clone directory
TMP_DIR="/tmp/catppuccin-qt5ct"

# Qt config paths
QT5_DIR="$HOME/.config/qt5ct/colors"
QT6_DIR="$HOME/.config/qt6ct/colors"

# Theme file to install
THEME_FILE="catppuccin-mocha-pink.conf"

echo "[+] Cloning Catppuccin qt5ct theme repo..."
git clone --depth=1 https://github.com/catppuccin/qt5ct "$TMP_DIR"

echo "[+] Creating config folders if not present..."
mkdir -p "$QT5_DIR" "$QT6_DIR"

echo "[+] Installing Mocha Pink theme..."
cp "$TMP_DIR/themes/$THEME_FILE" "$QT5_DIR/"
cp "$TMP_DIR/themes/$THEME_FILE" "$QT6_DIR/"

echo "[+] Cleaning up..."
rm -rf "$TMP_DIR"

echo "✅ Catppuccin Mocha Pink theme installed!"
echo "  - Qt5: $QT5_DIR/$THEME_FILE"
echo "  - Qt6: $QT6_DIR/$THEME_FILE"
echo ""
echo "💡 Now open qt5ct/qt6ct and select the theme in \"Colors\"."

