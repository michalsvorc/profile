# GNU/Linux profile configuration files

## Dependencies

### Required

- [exa](https://github.com/ogham/exa#readme)
- [fzf](https://github.com/junegunn/fzf#readme)
- [zsh](https://en.wikipedia.org/wiki/Z_shell)

### Optional

- [bat](https://github.com/sharkdp/bat#readme)
- [fd](https://github.com/sharkdp/fd)
- [neovim](https://github.com/neovim/neovim#readme)
- [ripgrep](https://github.com/BurntSushi/ripgrep#readme)
- [tmux](https://github.com/tmux/tmux#readme)
- terminal emulator with patched [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts#readme)

### Formatting and linting

Bash:
- [shellcheck](https://github.com/koalaman/shellcheck#readme)
- [shfmt](https://github.com/patrickvane/shfmt#readme)

## Plugins 

See [git submodules](.gitmodules) for the full list.

## Usage

Clone with submodules flag:

```shell
git clone --recurse-submodules
```

Run initialization script:

```shell
./scripts/init.sh
```
