# GNU/Linux profile configuration files

## Dependencies

### Required

- [delta diff](https://github.com/dandavison/delta#readme)
- [exa](https://github.com/ogham/exa#readme)
- [fzf](https://github.com/junegunn/fzf#readme)
- [lazygit](https://github.com/jesseduffield/lazygit#readme)
- [zsh](https://www.zsh.org/)

### Optional

- [bat](https://github.com/sharkdp/bat#readme)
- [nnn](https://github.com/jarun/nnn#readme)
- [ripgrep](https://github.com/BurntSushi/ripgrep#readme)
- [tmux](https://github.com/tmux/tmux#readme)
- terminal emulator with patched [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts#readme), [installation example](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack#linux)

### Plugins 

- [gitsubmodules](.gitsubmodules)

Installed by init script:

- [fzf-tab](https://github.com/Aloxaf/fzf-tab)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)

## Usage

Clone with submodules:

```console
git clone --recurse-submodules
```

Run initialization script:

```console
./scripts/init.sh
```

## Nvim configuration

- [nvim-basic-ide](https://github.com/michalsvorc/nvim-basic-ide#readme)
