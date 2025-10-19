# █▀▀ █▄░█ █░█
# ██▄ █░▀█ ▀▄▀
# environment

# Docs:
# - https://wiki.archlinux.org/title/Environment_variables
# - https://fishshell.com/docs/current/cmds/set.html
# - https://fishshell.com/docs/current/cmds/test.html

# Language
set -gx LANG en_US.UTF-8 # LANG
set -gx LANGUAGE en_US # LANGUAGE

# Default Apps
set -gx TERMINAL  kitty    # Terminal
set -gx EDITOR    nvim     # Editor
set -gx BROWSER   chromium # Browser
set -gx PAGER     less     # Paper

# Desktop
## Qt
### Refs:
# - https://doc.qt.io/qt-6/highdpi.html#environment-variable-reference
# - https://unix.stackexchange.com/questions/791847/after-upgrade-to-plasma-6-some-icons-are-blurry
# - https://www.reddit.com/r/kde/comments/1j3f3p2/plasma_632_fractional_scaling_some_icons_and_text/
### [DPI] Change the default scale rounding policy to Qt5 behavior
# set -gx QT_SCALE_FACTOR_ROUNDING_POLICY Round # (Qt5: Round, Qt6: Passthrough)

# Miniconda3
set -x CRYPTOGRAPHY_OPENSSL_NO_LEGACY 1
test -f /opt/miniconda3/etc/fish/conf.d/conda.fish; and source /opt/miniconda3/etc/fish/conf.d/conda.fish
