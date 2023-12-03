# My Dotfiles

This repository contains my dotfiles for my linux setup. I use [toml-bombadil](https://github.com/oknozor/toml-bombadil) to manage my dotfiles.

## Installation

First you need to clone this repository:
```bash
git clone https://github.com/EldosHD/dotFiles.git ~/my_dotfiles
```

### Prerequesits

You need **curl**, **cmake**, **a nerd font**, **rust** and **toml-bombadil** installed.

**Curl** (for later installing rust), **cmake** (some of the rust binaries need cmake) and the **nerd font** (otf-droid-nerd in this case) you can install via your package manager:

**Arch**: 
```bash
sudo pacman -S --noconfirm curl cmake ttf-firacode-nerd
```

---

**Rust** you can get from [rustup](https://rustup.rs/):

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

And **toml-bombadil** can be installed with cargo:

```bash
cargo install toml-bombadil
```

### Installing the dotfiles and dependencies

First I'd like to install a couple programs I find useful:

**Arch**: I use `yay` for installing from the AUR. You'll need to install `yay`, if your distro  doesn't ship with it.
```bash
yay -S --noconfirm visual-studio-code-bin firefox thunderbird discord keepass
```

---

Next install all additional rust binaries:
```bash
cargo install exa du-dust bat starship zellij cargo-info cargo-update nu alacritty git-delta ripgrep rm-improved cargo-mommy
```

---

Currently you have to link `nu` and `zellij` into a directory that is already included in `PATH`.
If you launch alacritty with a keyboard shortcut and this isn't the case, zellij wont start and if it does it will search endlessly for nu.
You can create symlinks with:
```bash
sudo ln -s ~/.cargo/bin/nu /usr/local/bin
sudo ln -s ~/.cargo/bin/zellij /usr/local/bin
```

Then just set up a keyboard shortcut in your WM settings for launching `/absolute/path/to/alacritty -e "%s"` or just set it as the default terminal emulator.

---

Lastly setup toml-bombadil and link the dotfiles:
```bash
bombadil install ~/my_dotfiles
bombadil link 
```

### Post Installation Setup

Install **Astronvim**:

```bash
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim
```