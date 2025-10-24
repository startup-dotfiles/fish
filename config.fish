# █▀ ▀█▀ ▄▀█ █▀█ ▀█▀ █░█ █▀█
# ▄█ ░█░ █▀█ █▀▄ ░█░ █▄█ █▀▀
# startup

# Docs:
# - https://fishshell.com/docs/current/index.html#configuration
# - https://fishshell.com/docs/current/fish_for_bash_users.html#fish-for-bash-users
# - https://fishshell.com/docs/current/interactive.html#interactive-use
# - https://fishshell.com/docs/current/commands.html

# █ █▀▄▀█ █▀█ █▀█ █▀█ ▀█▀
# █ █░▀░█ █▀▀ █▄█ █▀▄ ░█░
# imports

source $HOME/.config/fish/conf.d/xdg-dirs.fish
source $XDG_CONFIG_HOME/fish/conf.d/xdg-paths.fish
source $XDG_CONFIG_HOME/fish/conf.d/env.fish
source $XDG_CONFIG_HOME/fish/conf.d/aliases.fish
source $XDG_CONFIG_HOME/fish/conf.d/keybindings.fish

# █▀ █▀▀ █▀█ █ █▀█ ▀█▀ █▀
# ▄█ █▄▄ █▀▄ █ █▀▀ ░█░ ▄█
# scripts

# https://fishshell.com/docs/current/language.html#configuration-files
## only run in interactive shells
if status is-interactive
    # [atuin] show shell history (TUI)
    ## TODO: A temp solution to suppress the deprecation warning for fish's `bind -k/--key` usage.
    ## See https://github.com/atuinsh/atuin/issues/2803
    ##
    # atuin init fish | sed 's/-k up/up/' | source
    ##
    ## NOTE: Disbale default up arrow
    ## https://docs.atuin.sh/faq/#how-do-i-remove-the-default-up-arrow-binding
    ## https://docs.atuin.sh/configuration/key-binding/#fish
    atuin init fish --disable-up-arrow | sed 's/-k up/up/' | source
    bind \ca _atuin_search # binds to ctrl-a

    # [zoxide] smarter cd command
    zoxide init fish | source
    # [direnv] load and unload environment variables depending on the current directory
    direnv hook fish | source
end
## only run in login shells
if status is-login
end

# https://fishshell.com/docs/current/interactive.html#configurable-greeting
function fish_greeting
    # [fastfetch] display system info
    # fastfetch
    # [pokego] display pokemon ascii art
    pokego --no-title -random 1,3,6
    # [activate-linux] display "Activate Linux" watermark in your desktop (only DEs)
    # activate-linux -f "CaskaydiaCove Nerd Font" -f "开苹方-简" --daemonize
end

# █░█ ▄▀█ █▀█
# ▀▄▀ █▀█ █▀▄
# variables

set -g fish_autosuggestion_enabled 1





# ▀█▀ █░█ █▀▀ █▀▄▀█ █▀▀ █▀
# ░█░ █▀█ ██▄ █░▀░█ ██▄ ▄█
# themes

# Docs:
# - https://fishshell.com/docs/current/interactive.html#syntax-highlighting
# - https://fishshell.com/docs/current/interactive.html#programmable-prompt

set -g fish_cursor_default block # block, line, underscore

# [starship] customizable prompt
# starship init fish | source
