# ▄▀█ █░░ █ ▄▀█ █▀ █▀▀ █▀
# █▀█ █▄▄ █ █▀█ ▄█ ██▄ ▄█
# aliases

# Docs:
# - https://fishshell.com/docs/current/language.html#syntax-aliases
# - https://fishshell.com/docs/current/cmds/alias.html
# - https://fishshell.com/docs/current/cmds/abbr.html

# Detect AUR wrapper
if pacman -Qi yay >/dev/null
    set aurhelper yay
else if pacman -Qi paru >/dev/null
    set aurhelper paru
end


# Common
abbr -a cls     'clear'
abbr -a mkdir   'mkdir -p'
abbr -a grep    'grep --color=auto'
abbr -a untar   'tar -zxvf'
abbr -a df      'df -lh'
abbr -a du      'du -lh --max-depth=1 2>/dev/null | sort -h'
abbr -a cat     'bat -p'
abbr -a lsblk   'lsblk -o name,mountpoint,size,uuid'
abbr -a rm      'trash-put'

# Dirctory navigation
abbr -a .. 'cd ..'
abbr -a .2 'cd ../..'
abbr -a .3 'cd ../../..'
abbr -a .4 'cd ../../../..'
abbr -a .5 'cd ../../../../..'

# Show file list
abbr -a l 'eza -lh --icons=auto --sort=name --group-directories-first' # long list
abbr -a ls 'eza -1  --icons=auto --sort=name --group-directories-first' # short list
abbr -a la 'eza -lha --icons=auto --sort=name --group-directories-first' # long list (all)
abbr -a ld 'eza -lhD --icons=auto --sort=name --group-directories-first' # long list (only dirs)
abbr -a lt 'eza --tree --icons=auto' # list folder as tree

# Package manager
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list available package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -

# Kitty
abbr -a kimage     'kitty +kitten icat' # render image in kitty (support .png/.jpg/.gif/...)
abbr -a knotify    'kitty +kitten notify' # send desktop notification by kitty
abbr -a kbackgroud 'kitty +kitten panel --edge=background' # display <your_program_output_panel> as your desktop background (such as htop, btop...)
