# Follow the XDG Base Directory Specification so the home directory stays clean.

# - XDG_CONFIG_HOME
# - XDG_CACHE_HOME
# - XDG_DATA_HOME
# - XDG_STATE_HOME

## Check tools:
# - xdg-ninja: https://github.com/b3nj5m1n/xdg-ninja

## Posts:
# - https://www.reddit.com/r/linux/comments/1066ulb/why_is_compliance_with_xdg_base_directory/

## Starts supporting XDG in newer versions; manual migration to the specified paths is required
# - $HOME/.gdbinit     -> $XDG_CONFIG_HOME/gdb/gdbinit
# - $HOME/.gdb_history -> $XDG_CONFIG_HOME/gdb/gdb_history
# - $HOME/.gitconfig -> $XDG_CONFIG_HOME/git/config
# - $HOME/.gitignore -> $XDG_CONFIG_HOME/git/ignore
# - $HOME/.ipython/  -> $XDG_CONFIG_HOME/ipython/
# - $HOME/.python_histroy -> $XDG_CONFIG_HOME/python/pythonrc

# $HOME/.zshrc        -> $XDG_CONFIG_HOME/zsh/.zshrc       (change ZDOTDIR="$XDG_CONFIG_HOME"/zsh)
# $HOME/.zsh_history  -> $XDG_CONFIG_HOME/zsh/.zsh_history


# Aliases
alias mvn="mvn -gs $XDG_CONFIG_HOME/maven/settings.xml"
alias nvidia-settings="nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings"  # original: $HOME/.nvidia-settings-rc
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"                               # original: $HOME/.wget-hsts
alias yarn="yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"                          # original: $HOME/.yarnrc
alias lmms="lmms -c "$XDG_CONFIG_HOME/lmms/lmmsrc.xml""

## ----------------------------------------------------------------------------
## * System
## ----------------------------------------------------------------------------

## Icons
# original value: $HOME/.icons/
set -gx XCURSOR_PATH "/usr/share/icons:$XDG_DATA_HOME/icons"

## GTK 2
# original value: $HOME/.gtkrc-2.0
set -gx GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"


## ----------------------------------------------------------------------------
## * Softwares
## ----------------------------------------------------------------------------

## gnupg
# original value: $HOME/.gnupg/
set -gx GNUPGHOME "$XDG_DATA_HOME/gnupg"
## ansible
# original value: $HOME/.ansible/
set -gx ANSIBLE_HOME "$XDG_DATA_HOME/ansible"

## cuda
# original value: $HOME/.nv/
set -gx CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"
## texlive
# original value: $HOME/.texlive/
set -gx TEXMFVAR "$XDG_CACHE_HOME/texlive/texmf-var"

## less
# original value: $HOME/.lesshst
set -gx LESSHISTFILE "$XDG_STATE_HOME/lesshst" # history
## node
# original value: $HOME/.node_repl_history
set -gx NODE_REPL_HISTORY "$XDG_STATE_HOME/node_repl_history" # history

## npm
# original value: $HOME/.npm/
set -gx NPM_CONFIG_INIT_MODULE "$XDG_CONFIG_HOME/npm/config/npm-init.js"
set -gx NPM_CONFIG_CACHE       "$XDG_CACHE_HOME/npm"
set -gx NPM_CONFIG_TMP         "$XDG_RUNTIME_DIR/npm"


## ----------------------------------------------------------------------------
## * Programming
## ----------------------------------------------------------------------------

## Language: Go
### Refs:
# - https://go.dev/wiki/GOPATH
# - https://go.dev/wiki/SettingGOPATH
# - https://pkg.go.dev/cmd/go#hdr-GOPATH_environment_variable
set -gx GOPATH         "$XDG_DATA_HOME/go"   # original value: $HOME/go
set -gx GOBIN          "$GOPATH/bin"         # go install
set -gx GOMODCACHE     "$GOPATH/pkg/mod"     # go get
set -gx GOCACHE        "$XDG_CACHE_HOME/go/go-build"  # default: $XDG_CACHE_HOME/go-build
### https://github.com/golang/go/issues/68936#issuecomment-2295578848
#set -gx GOTELEMETRYDIR "$XDG_CACHE_HOME/go/telemetry" # original value: $XDG_CONFIG_HOME/go/telemetry

## Language: Java
### Some applications don't respect this setting.
set -gx _JAVA_OPTIONS -Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java" # original value: $HOME/.java/

## Language: Python
set -gx PYTHONSTARTUP "$XDG_CONFIG_HOME/python/pythonrc" # original value:

## Language: Rust
set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup" # original value: $HOME/.rustup/
set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"   # original value: $HOME/.cargo/
