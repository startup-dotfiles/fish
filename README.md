# Dotfiles --- fish shell

```sh
# Backup/Rename
[ -d $HOME/.config/fish ] mv $HOME/.config/fish $HOME/.config/fish.bak
# Clone
git clone https://github.com/startup-dotfiles/fish $HOME/.config/fish

# These files can be deleted after installation.
rm -r README.md LICENSE assets/ .git/ .gitignore
```

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
