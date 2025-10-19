# XDG Base Directory Specification

# Docs:
# - XDG Base Directory Specification: https://specifications.freedesktop.org/basedir-spec/latest/
# - Arch Wiki: https://wiki.archlinux.org/title/XDG_Base_Directory

## User directories
set -gx XDG_CONFIG_HOME "$HOME/.config"       # User-specific configuration files (analogous to /etc)
set -gx XDG_CACHE_HOME  "$HOME/.cache"        # User-specific non-essential data files files (analogous to /var/cache)
set -gx XDG_DATA_HOME   "$HOME/.local/share"  # User-specific data files (analogous to /usr/share)
set -gx XDG_STATE_HOME  "$HOME/.local/state"  # User-specific state files (analogous to /var/lib)
# XDG_RUNTIME_DIR # User-specific non-essential runtime files and other file objects

## System directories
# XDG_CONFIG_DIRS # List of directories separated by : (analogous to PATH)
# XDG_DATA_DIRS   # List of directories separated by : (analogous to PATH)

