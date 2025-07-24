# Installation

## Prerequisites

You need **curl**, **cmake**, **a nerd font**, **rust** and **toml-bombadil** installed.

**Curl** (it was used for installing rust, but now I just use the rust package. Curl is still used a lot so I kept it in here), **cmake** (some of the rust binaries need cmake) and the **nerd font** (ttf-firacode-nerd in this case), alongside an **emoji font** (noto-fonts-emoji) you can install via your package manager:

**Arch**:

```bash
sudo pacman -S --noconfirm curl cmake ttf-firacode-nerd noto-fonts-emoji toml-bombadil rust
```

______________________________________________________________________

<details>
<summary>Alternative: Rust via rustup</summary>

Alternativly, you can get **Rust** from [rustup](https://rustup.rs/):

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

</details>

I'll also install **cargo-binstall** to speed up later installations:

```bash
cargo install cargo-binstall
```

or install it from your package manager:

```bash
yay -S --noconfirm cargo-binstall
```

## Installing the dotfiles and dependencies

First you need to clone this repository:

```bash
git clone git@github.com:VJMReichenbach/dotFiles.git ~/my_dotfiles
```

Then I like to install a couple programs I find useful:

**Arch**: I use `yay` for installing from the AUR. You'll need to install `yay`, if your distro doesn't ship with it.

```bash
yay -S --noconfirm thunderbird vesktop-bin keepassxc catppuccin-cursors-mocha neovim nextcloud-client fzf evince xclip lazygit btop thunar
```

______________________________________________________________________

Next install all additional rust binaries:

```bash
cargo binstall eza du-dust bat starship zellij cargo-info cargo-update nu alacritty git-delta ripgrep rm-improved cargo-mommy kanata
```

______________________________________________________________________

Before finishing up, install the **catppuccin** themes for **alacritty**, **bat**, **btop**, **delta**, **lazygit** and **ulauncher** and also the [candy-icons](https://github.com/EliverLara/candy-icons) icon pack:

```bash
~/my_dotfiles/scripts/install_alacritty_themes.sh
~/my_dotfiles/scripts/install_bat_themes.sh
~/my_dotfiles/scripts/install_btop_theme.sh
~/my_dotfiles/scripts/install_delta_themes.sh
~/my_dotfiles/scripts/install_icon_theme.sh
~/my_dotfiles/scripts/install_hyprland_colors.sh
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

Lastly setup toml-bombadil and link the dotfiles:

```bash
bombadil install ~/my_dotfiles
bombadil link # --profile desktop if you want to use the monitor profile for my desktop pc
```

## Next steps

Take a look at:

- [browser setup](/docs/browser.md)
- [hyprland setup](/docs/hyprland.md)
- [post-installation setup](/docs/post-installation.md)
