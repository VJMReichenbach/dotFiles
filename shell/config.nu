$env.EDITOR = "/usr/bin/nvim"

$env.config = {
    # Sort alphabetically
    rm: {
        always_trash: true # always act as if -t was given. Can be overridden with -p
    }
    show_banner: false
    edit_mode: vi
    keybindings: [
        {
            name: clear 
            modifier: control
            keycode: char_j 
            mode: [vi_insert vi_normal]
            event: [
                { send: ClearScreen } # set clear screen to C-j
            ]
        },
        {
            name: autocomplete 
            modifier: control
            keycode: char_l
            mode: [vi_insert vi_normal]
            event: [
                { send: HistoryHintComplete} #  set autocomplete to C-l
            ]
        }
    ]
}

###########################
# alias

# rm
# removes neovim config
alias rmconfig = rm -rf ~/.config/nvim ~/.local/share/nvim/ ~/.local/state/nvim/ ~/.cache/nvim/ ~/my_dotfiles/.dots/

# kills currently running waybar instances and starts a new one
def refresh-waybar [] {
    do -i {pkill waybar} # ignores errors
    hyprctl dispatch exec waybar
}

# xclip
# copys input to clipboard
alias clipboard = xclip -selection clipboard

# eza
alias e = eza --all --long --git --icons --group-directories-first --header --smart-group
alias eg = e --group
alias et = e --tree

# cargo
alias ca = cargo mommy
alias cacu = ca install-update -l
alias ucap = ca install-update -a

# nvim
alias v = nvim .

# bat
alias cbat = bat --decorations never

# git
alias cg = cd (git rev-parse --show-toplevel)
alias ga = git add
alias gc = git commit
alias gac = git commit -a
alias gpl = git pull
alias gpu = git push

# systemctl
alias sysstat = sudo systemctl status
alias sysen = sudo systemctl enable
alias sysdis = sudo systemctl disable
alias sysstart = sudo systemctl start
alias sysrest = sudo systemctl restart
alias sysstop = sudo systemctl stop

# completions
use ~/nu_scripts/custom-completions/bat/bat-completions.nu *
use ~/nu_scripts/custom-completions/curl/curl-completions.nu *
use ~/nu_scripts/custom-completions/cargo/cargo-completions.nu *
use ~/nu_scripts/custom-completions/docker/docker-completions.nu *
use ~/nu_scripts/custom-completions/eza/eza-completions.nu *
use ~/nu_scripts/custom-completions/git/git-completions.nu *
use ~/nu_scripts/custom-completions/make/make-completions.nu *
use ~/nu_scripts/custom-completions/rustup/rustup-completions.nu *
use ~/nu_scripts/custom-completions/ssh/ssh-completions.nu *
use ~/nu_scripts/custom-completions/tar/tar-completions.nu *
use ~/nu_scripts/custom-completions/typst/typst-completions.nu *
use ~/nu_scripts/custom-completions/zellij/zellij-completions.nu *

# theme
use ~/nu_scripts/themes/nu-themes/catppuccin-mocha.nu

# Starship
use ~/.cache/starship/init.nu
