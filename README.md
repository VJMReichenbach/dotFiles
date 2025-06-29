# My Dotfiles

This repository contains my dotfiles for my Linux setup. I use [toml-bombadil](https://github.com/oknozor/toml-bombadil) to manage my dotfiles.

## Installation

### Replace firefox

First off, because of Mozilla drama, I replaced firefox with librewolf.
Since librewolf is in the AUR, you either need to install it manually or use a wrapper like [yay](https://github.com/Jguer/yay).

```bash
yay -R --noconfirm firefox
yay -S --noconfirm librewolf-bin
```

Then, if desired, go to `settings -> Privacy&Security -> Cookies and Site Data -> Uncheck: Delete cookies and site data when LibreWolf is closed`

After that, install the following extensions:

- [Dark Reader](https://addons.mozilla.org/en-US/firefox/addon/darkreader/)
- [Firefox Color](https://addons.mozilla.org/en-US/firefox/addon/firefox-color/)
- [Floccus](https://addons.mozilla.org/en-US/firefox/addon/floccus/)
- [SponsorBlock](https://addons.mozilla.org/en-US/firefox/addon/sponsorblock/)
- [Stylus](https://addons.mozilla.org/en-US/firefox/addon/styl-us/)

Log into floccus, after setting up nextcloud.

### Prerequisites

You need **curl**, **cmake**, **a nerd font**, **rust** and **toml-bombadil** installed.

**Curl** (it was used for installing rust, but now I just use the rust package. Curl is still used a lot so I kept it in here), **cmake** (some of the rust binaries need cmake) and the **nerd font** (ttf-firacode-nerd in this case), alongside an **emoji font** (noto-fonts-emoji) you can install via your package manager:

**Arch**:

```bash
sudo pacman -S --noconfirm curl cmake ttf-firacode-nerd noto-fonts-emoji toml-bombadil rust
```

______________________________________________________________________

<details>
  <summary>Alternative: Rust via rustup</summary>

````
Alternativly, you can get **Rust** from [rustup](https://rustup.rs/):

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
````

</details>

I'll also install **cargo-binstall** to speed up later installations:

```bash
cargo install cargo-binstall
```

### Installing the dotfiles and dependencies

First you need to clone this repository:

```bash
git clone git@github.com:VJMReichenbach/dotFiles.git ~/my_dotfiles
```

Then I like to install a couple programs I find useful:

**Arch**: I use `yay` for installing from the AUR. You'll need to install `yay`, if your distro doesn't ship with it.

```bash
yay -S --noconfirm firefox thunderbird vesktop-bin keepassxc catppuccin-cursors-mocha neovim nextcloud-client ulauncher fzf evince xclip lazygit btop
```

______________________________________________________________________

Remember to also start the ulauncher deamon:

```bash
systemctl --user enable --now ulauncher
```

______________________________________________________________________

Next install all additional rust binaries:

```bash
cargo binstall eza du-dust bat starship zellij cargo-info cargo-update nu alacritty git-delta ripgrep rm-improved cargo-mommy kanata
```

______________________________________________________________________

Currently you have to link `nu` and `zellij` into a directory that is already included in `PATH`.
If you launch alacritty with a keyboard shortcut and this isn't the case, zellij wont start and if it does it will search endlessly for nu.
You can create symlinks with:

```bash
sudo ln -s ~/.cargo/bin/nu /usr/local/bin
sudo ln -s ~/.cargo/bin/zellij /usr/local/bin
```

Then just set up a keyboard shortcut in your WM settings for launching `/absolute/path/to/alacritty -e "%s"` or just set it as the default terminal emulator.

______________________________________________________________________

Before finishing up, install the **catppuccin** themes for **alacritty**, **bat**, **btop**, **delta**, **lazygit** and **ulauncher** and also the [candy-icons](https://github.com/EliverLara/candy-icons) icon pack:

```bash
~/my_dotfiles/scripts/install_alacritty_themes.sh
~/my_dotfiles/scripts/install_bat_themes.sh
~/my_dotfiles/scripts/install_btop_theme.sh
~/my_dotfiles/scripts/install_delta_themes.sh
~/my_dotfiles/scripts/install_icon_theme.sh
~/my_dotfiles/scripts/install_lazygit_themes.sh
~/my_dotfiles/scripts/install_ulauncher_theme.sh
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
bombadil link 
```

### Post Installation Setup

Set the **GTK-Theme** and the **Mouse Cursor** to Catppuccin-Mocha:

```bash
gsettings set org.gnome.desktop.interface gtk-theme Catppuccin-Mocha-Standard-Pink-Dark
xfconf-query --channel xsettings --property /Gtk/CursorThemeName --set Catppuccin-Mocha-Pink-Cursors
```

______________________________________________________________________

Things you might want to do manually:

- Install the [catppuccin grub theme](https://github.com/catppuccin/grub)
- Install the [catppuccin tty theme](https://github.com/catppuccin/tty)
- Install the [catppuccin Thunderbird theme](https://github.com/catppuccin/thunderbird)
- Import all the [catppuccin userstyles](https://github.com/catppuccin/userstyles)
