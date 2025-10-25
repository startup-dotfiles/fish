# Dotfiles --- fish shell

```sh
# Backup/Rename
[ -d $HOME/.config/fish ] mv $HOME/.config/fish $HOME/.config/fish.bak
# Clone
git clone https://github.com/startup-dotfiles/shells.git $HOME/.config/fish

# These files can be deleted after installation.
rm -r README.md LICENSE assets/ .git/ .gitignore
```

## Dependencies

> [!NOTE]
> These dependencies are not fixed and may change as the configuration is updated;
> if you don't need some of the tools, comment out the related entries in the configuration files.

- Terminal emulator: [kitty](https://github.com/kovidgoyal/kitty)
- CLIs
  - [fastfetch](https://github.com/fastfetch-cli/fastfetch): fetching system information and displaying it in a visually appealing way.
  - [eza](https://github.com/eza-community/eza): A modern alternative to `ls`.
  - [bat](https://github.com/sharkdp/bat): A cat(1) clone with wings.
  - [zoxide](https://github.com/ajeetdsouza/zoxide): A smarter cd command.
  - [trash-cli](https://github.com/andreafrancia/trash-cli): Command Line Interface to FreeDesktop.org Trash.
  - [direnv](https://github.com/direnv/direnv): unclutter your .profile.
  - [yay](https://github.com/Jguer/yay): Yet another Yogurt - An AUR Helper written in Go. (only Arch Linux)
  - [paru](https://github.com/Morganamilo/paru): Feature packed AUR helper. (only Arch Linux)
- TUIs
  - [atuin](https://github.com/atuinsh/atuin): Magical shell history.
- Scripts
  - [pokego](https://github.com/rubiin/pokego): display Pokémon sprites in color directly in your terminal.
  - [starship](https://github.com/starship/starship): The minimal, blazing-fast, and infinitely customizable prompt for any shell!

## Completions

```sh
# atuin
atuin gen-completions --shell fish --out-dir $HOME/.config/fish/completions/
# hugo
hugo completion fish > $HOME/.config/fish/completions/hugo.fish
```

## Keep $HOME clean

## Autin

Atuin installs its binaries to `~/.autin/bin`([atuin installation](https://docs.atuin.sh/guide/installation/)).
For fish, it adds an `atuin.env.fish` file to `conf.d` after installation.
To keep $HOME clean, move `~/.autin/bin` to `~/.local/share/atuin/` and update the files inside so the paths are consistent.
Finally, set the `install_prefix` variable to `~/.local/share/atuin/bin` in `~/.config/atuin/atuin-receipt.json`.

You can refer to my changes [here](./assets/autin/).

## Others

See [conf.d/xdg-paths.fish](./conf.d/xdg-paths.fish)
