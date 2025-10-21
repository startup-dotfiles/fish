# Follow the XDG Base Directory Specification so the home directory stays clean.

# - XDG_CONFIG_HOME
# - XDG_CACHE_HOME
# - XDG_DATA_HOME
# - XDG_STATE_HOME

## Refs:
# - https://wiki.archlinuxcn.org/wiki/XDG_%E5%9F%BA%E6%9C%AC%E7%9B%AE%E5%BD%95

## Check tools:
# - xdg-ninja: https://github.com/b3nj5m1n/xdg-ninja
# - boxxy: https://github.com/queer/boxxy

## Posts:
# - https://www.reddit.com/r/linux/comments/1066ulb/why_is_compliance_with_xdg_base_directory/

## Starts supporting XDG in newer versions; manual migration to the specified paths is required
# - $HOME/.gdbinit -> $XDG_CONFIG_HOME/gdb/gdbinit (since GDB 11.1)

# - $HOME/.conda/  -> $XDG_CONFIG_HOME/conda/         (since conda#10982)
# - $HOME/.condarc -> $XDG_CONFIG_HOME/conda/condarc  (since conda#10982)
# - $HOME/.aria2/  -> $XDG_CONFIG_HOME/aria2/ (since aria2#395)

# $HOME/.zshrc        -> $XDG_CONFIG_HOME/zsh/.zshrc       (set ZDOTDIR="$XDG_CONFIG_HOME"/zsh in $HOME/.zshenv)
# $HOME/.zsh_history  -> $XDG_CONFIG_HOME/zsh/.zsh_history (follow $ZDOTDIR)

# $HOME/.vimrc   -> $XDG_CONFIG_HOME/vim/vimrc (since Vim 9.1.0327)
# $HOME/.viminfo -> $XDG_STATE_HOME/viminfo    (set viminfofile=$XDG_STATE_HOME/viminfo in vimrc)

# Since https://github.com/git/git/commit/{0d94427,dc79687,684e40f}
# - $HOME/.gitconfig       -> $XDG_CONFIG_HOME/git/config
# - $HOME/.gitignore       -> $XDG_CONFIG_HOME/git/ignore
# - $HOME/.gitattributes   -> $XDG_CONFIG_HOME/git/attributes
# - $HOME/.git-credentials -> $XDG_CONFIG_HOME/git/credentials
# - $HOME/.gitk            -> $XDG_CONFIG_HOME/git/gitk


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

## bash
# original value: $HOME/.bash_history
set -gx HISTFILE "$XDG_STATE_HOME/bash_history" # history
# - https://savannah.gnu.org/patch/index.php?10431 (Open)

# z
# https://github.com/rupa/z/issues/267 (Open)
# original value: $HOME/.z/
set -gx _Z_DATA "$XDG_DATA_HOME/z"

# ncurses
# original value: $HOME/.terminfo/
set -gx TERMINFO      "$XDG_DATA_HOME/terminfo"
set -gx TERMINFO_DIRS "$XDG_DATA_HOME/terminfo:/usr/share/terminfo"

## ----------------------------------------------------------------------------
## * Softwares
## ----------------------------------------------------------------------------

## starship
## original value: $XDG_CONFIG_HOME/starship.toml
set -gx STARSHIP_CONFIG "$XDG_CONFIG_HOME/starship/starship.toml"

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
# original value: $HOME/.texlive/texmf-var/
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

## ipython
# original value: $HOME/.ipython/
set -gx IPYTHONDIR "$XDG_CONFIG_HOME/ipython"

## gdb
# original value: $HOME/.gdb_history
# Since GDB 11.1
set -gx GDBHISTFILE "$XDG_STATE_HOME/gdb_history" # history

## mysql/mariadb
# https://mariadb.com/docs/server/server-management/install-and-upgrade-mariadb/configuring-mariadb/mariadb-environment-variables
# original value: $HOME/.{mysql,mariadb}_history
set -gx MYSQL_HISTFILE "$XDG_STATE_HOME/mariadb_history" # history

## slime
# original value: $HOME/.slime/
set -gx SLIME_HOME "$XDG_CACHE_HOME/slime"

## vscode/vscodium
# https://github.com/Microsoft/vscode/issues/3884 (Open)
# original value: $HOME/.vscode-oss/

## lldb
# https://github.com/llvm/llvm-project/issues/71426 (Open)
# original value: $HOME/.lldb/

## clang-format
# original value: $HOME/.clang-format
## clang-format -style=file:<format_file_path>

# codeium
# - https://github.com/Exafunction/windsurf.vim/issues/290 (Open)
# original value: $HOME/.codeium

# Mozilla Firefox
# - https://phabricator.services.mozilla.com/D6995
# - https://bugzilla.mozilla.org/show_bug.cgi?id=259356 (Open)
# original value: $HOME/.mozilla/
set -gx MOZ_LEGACY_HOME 0  # no effect

# Zen Browser
# - https://github.com/zen-browser/desktop/issues/7280 (Open)
# original value: $HOME/.zen/

# Andorid emulator console
# - https://developer.android.com/studio/run/emulator-console
# original value: $HOME/.emulator_console_auth_token

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
set -gx PYTHONSTARTUP "$XDG_CONFIG_HOME/python/pythonrc"
### https://github.com/python/cpython/pull/13208#issuecomment-1877159768
### since Python 3.13
set -gx PYTHON_HISTORY "$XDG_STATE_HOME/python_history" # original value: $HOME/.python_history

## Language: Rust
set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup" # original value: $HOME/.rustup/
set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"   # original value: $HOME/.cargo/
