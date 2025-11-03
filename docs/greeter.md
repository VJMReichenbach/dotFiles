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

Lastly you have to modify the permissions of a few directories, so that the `greeter` user will be able to read the config files content.

```bash
chmod o+x ~
```

```bash
chmod o+rx ~/.greeter_conf
```

```bash
chmod o+r ~/.greeter_conf/*
```
