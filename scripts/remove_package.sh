#!/bin/bash

# Stolen from omarchy: https://github.com/basecamp/omarchy/blob/dev/bin/omarchy-pkg-remove

# Show a fuzzy-finder TUI for picking packages installed on the system to be removed.

fzf_args=(
  --multi
  --preview 'yay -Qi {1}'
  --preview-label='M-p: toggle description, C-j/k: scroll, tab: multi-select'
  --preview-label-pos='bottom'
  --preview-window 'down:65%:wrap'
  --bind 'alt-p:toggle-preview'
  --bind 'alt-d:preview-half-page-down,alt-u:preview-half-page-up'
  --color 'pointer:red,marker:red'
)

pkg_names=$(yay -Qqe | fzf "${fzf_args[@]}")

if [[ -n $pkg_names ]]; then
  # Convert newline-separated selections to space-separated for yay
  echo "$pkg_names" | tr '\n' ' ' | xargs sudo pacman -Rns --noconfirm
  echo
  gum spin --spinner "line" --spinner.foreground="255" --title " Done! Press any key to close..." -- bash -c 'read -n 1 -s'
fi
