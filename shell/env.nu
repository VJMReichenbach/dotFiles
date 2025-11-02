use std/util "path add"
# Definition of env variables

## PATH
path add "~/go/bin"

## EPICS
# $env.EPICS_BASE = ([$env.HOME, '/EPICS/epics-base'] | str join)
# $env.EPICS_HOST_ARCH = ([$env.EPICS_BASE, '/startup/EpicsHostArch'] | str join)
# $env.PATH = ($env.PATH | split row (char esep) | prepend $"($env.EPICS_BASE)/bin/(/bin/sh ($env.EPICS_HOST_ARCH))")

## Devkitpro
$env.DEVKITPRO = '/opt/devkitpro'
$env.DEVKITARM = '/opt/devkitpro/devkitARM'
$env.DEVKITPPC = '/opt/devkitpro/devkitPPC'

# Cargo mommy
$env.CARGO_MOMMYS_MOODS = 'chill/ominous/thirsty'
$env.CARGO_MOMMYS_LITTLE = 'boy/girl'

# lazygit
let lazygit_base = [$env.HOME, '/.config/lazygit/'] | str join
let lazygit_conf = [$lazygit_base, 'config.yml'] | str join
let lazygit_theme = [$lazygit_base, 'catppuccin-mocha-pink.yml'] | str join
$env.LG_CONFIG_FILE = [$lazygit_conf, "," ,$lazygit_theme] | str join

# Starship
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
