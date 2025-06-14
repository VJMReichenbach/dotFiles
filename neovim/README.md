This config is based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).
Some of it was also inspired by my friends [personal config](https://github.com/lukasgeis/dotfiles).

______________________________________________________________________

Clean complete config with:

```bash
rm -rf ~/.config/nvim ~/.local/share/nvim/ ~/.local/state/nvim/ ~/.cache/nvim/
```

It is important, that `~/.config/nvim` doesn't have a `/` at the end, because it's a symlink.

You might also need to remove a file from `.dots/`, since toml-bombadil doesn't do it automatically:

```bash
rm -rf .dots/
```
