# Hyprland Setup

I use [hyprland](https://hypr.land).
First, install the programs below

```bash
yay -S --noconfirm hyprland hyprpaper hyprshot cliphist nwg-look dunst waybar wofi hyprpolkitagent xdg-desktop-portal-gtk
```

additionally, if you need brightness controll (e.g. on a laptop) install this:

```bash
yay -S --noconfirm brightnessctl
```

also, run the install script for the catppuccin mocha colors for hyprland:

```bash
~/my_dotfiles/scripts/install_hyprland_colors.sh
```

lastly, clone [this](https://github.com/orangci/walls-catppuccin-mocha) repo that contains a bunch of wallpapers I like:

```bash
git clone https://github.com/orangci/walls-catppuccin-mocha ~/wallpapers
```

## QT Themes

To set the Qt Theme correctly install the following programs

```bash
yay -S --noconfirm kvantum kvantum-qt5 qt5ct qt6ct
```

Then clone [this](https://github.com/catppuccin/Kvantum) repo, install the desired catppuccin kvantum theme using **Kvantum Manager** (search using rofi or use command `kvantummanager`) and set it under _Change/Delete Theme_.

Lastly open `qt5ct` (or search for _QT5 Settings_) and `qt6ct` (or search for _QT6 Settings_) respectivly and set:

- Syle: **kvantum-dark**
- Color scheme: **Style's colors**
