# Greeter Instructions

Starting Hyprland via tty is normally sufficient, but in case you want to use something more advanced you can use a greeter.

```bash
yay -S greetd greetd-agreety greetd-tuigreet
```

Then enable `greetd`:

```bash
sudo systemctl enable greetd
```

Then edit the greetd config:

```toml
[terminal]
vt = 1

[default_session]

command = "tuigreet --issue --time --asterisks --asterisks-char='+'"
user = "greeter"
```

This alone is sufficient, however since greetd starts as soon as possible, boot messages still litter the screen when tuigreet starts.
If you don't want to disable boot messages, you can make sure greetd starts after the boot process is done by editing `/etc/systemd/system/greetd.service.d/override.conf`:

```ini
[Service]
Type=idle
```

Now you can reboot.
