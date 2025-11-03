# Greeter Instructions

Starting Hyprland via tty is normally sufficient, but in case you want to use something more advanced you can use a greeter.

```bash
yay -S greetd greetd-agreety greetd-regreet
```

Then enable `greetd`:

```bash
sudo systemctl enable greetd
```

Then create the links to the greeter config files in the home directory:
This directory is created by `bombadil link`.
So run that command, if they don't exist yet.

```bash
for f in ~/.greeter_conf/*; do
    [ -f "$f" ] && sudo ln -sf "$f" /etc/greetd/$(basename "$f")
done
```

Next, you have to modify the permissions of a few directories, so that the `greeter` user will be able to read the config files content.

```bash
chmod o+x ~
```

```bash
chmod o+rx ~/.greeter_conf
```

```bash
chmod o+r ~/.greeter_conf/*
```

Lastly, you have to install your GTK themes and icon theme system wide, so regreet can find them. Make sure the locations in the following commands are correct.

```bash
sudo mkdir -p /usr/share/themes
sudo cp -r ~/.local/share/themes/* /usr/share/themes/
```

```bash
sudo mkdir -p /usr/share/icons
sudo cp -r ~/.icons/* /usr/share/icons/
```
