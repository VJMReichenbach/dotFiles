# Installation

## Prerequisites

You need **curl**, **cmake**, **a nerd font**, **rust** and **toml-bombadil** installed.

**Curl** (it was used for installing rust, but now I just use the rust package. Curl is still used a lot so I kept it in here), **cmake** (some of the rust binaries need cmake) and the **nerd font** (ttf-firacode-nerd in this case), alongside an **emoji font** (noto-fonts-emoji) you can install via your package manager:

**Arch**:

```bash
sudo pacman -S --noconfirm curl cmake ttf-firacode-nerd noto-fonts-emoji toml-bombadil
```

______________________________________________________________________

## Installing the dotfiles and dependencies

First you need to clone this repository and my neovim config:

```bash
git clone git@github.com:VJMReichenbach/dotFiles.git ~/my_dotfiles
git clone git@github.com:VJMReichenbach/nvim.git ~/my_dotfiles/neovim
```

Then I like to install a couple programs I find useful:

**Arch**:

```bash
sudo pacman -S --noconfirm 7zip bat bitwarden btop cargo-binstall dust evince eza file-roller fwupd fzf ghostty git-delta gvfs-mtp gvfs lazygit libmtp mtpfs network-manager-applet neovim nextcloud-client nushell qt5-wayland qt6-wayland ripgrep rust starship tar thunar thunar-archive-plugin thunar-volman thunderbird unrar unzip zellij
```

______________________________________________________________________

A few programs I use are only in the [AUR](https://aur.archlinux.org/).
To install them automatically, use a pacman wrapper like [yay](https://github.com/Jguer/yay).
Then you can install them all at once:

```bash
yay -S --noconfirm vesktop-bin catppuccin-cursors-mocha
```

______________________________________________________________________

Next install all binaries, that are only avliable on cargo:

```bash
cargo binstall cargo-mommy cargo-update kanata
```

______________________________________________________________________

Before finishing up, install the **catppuccin** themes for various applications and also the [candy-icons](https://github.com/EliverLara/candy-icons) icon pack:

```bash
~/my_dotfiles/scripts/install_bat_themes.sh
~/my_dotfiles/scripts/install_btop_theme.sh
~/my_dotfiles/scripts/install_delta_themes.sh
~/my_dotfiles/scripts/install_icon_theme.sh
~/my_dotfiles/scripts/install_lazygit_themes.sh
```

______________________________________________________________________

Clone the **nu_scripts** repo for autocompletions:

```bash
git clone git@github.com:nushell/nu_scripts.git ~/nu_scripts
```

______________________________________________________________________

You might also want to setup the pre-commit hooks:

```bash
~/my_dotfiles/scripts/setup_hooks.sh
```

______________________________________________________________________

When using the **kanata** keyboard config, you should also link the service file and enable the service, so it starts on boot:

```bash
sudo ln -s ~/.cargo/bin/kanata /usr/bin
sudo mkdir -p /etc/kanata
sudo chown valentin:valentin /etc/kanata # modify when using a different user
sudo ln -s ~/my_dotfiles/keyboard/kanata.service /etc/systemd/system/
sudo systemctl enable --now kanata
```

______________________________________________________________________

Enable the `fwupd-refresh.timer` to automatically download the latest metadata from LVFS:

```bash
sudo systemctl enable --now fwupd-refresh.timer
```

______________________________________________________________________

To make sure the power button script runs, you need to configure systemd to ignore the power button event:

```bash
sudo nvim /etc/systemd/logind.conf
```

Add:

```conf
HandlePowerKey=ignore
HandlePowerKeyLongPress=ignore
PowerKeyIgnoreInhibited=yes
```

Then reboot.

______________________________________________________________________

Lastly setup toml-bombadil and link the dotfiles:

```bash
bombadil install ~/my_dotfiles
bombadil link # --profile desktop if you want to use the monitor profile for my desktop pc
```

## Next steps

Take a look at:

- [browser setup](/docs/browser.md)
- [hyprland setup](/docs/hyprland.md)
- [greeter setup](/docs/greeter.md)
- [post-installation setup](/docs/post-installation.md)
