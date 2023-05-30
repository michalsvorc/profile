# GNU/Linux profile configuration files

## Dependencies

### Required

- [delta diff](https://github.com/dandavison/delta#readme)
- [exa](https://github.com/ogham/exa#readme)
- [fzf](https://github.com/junegunn/fzf#readme)
- [zsh](https://github.com/ohmyzsh/ohmyzsh#readme)

### Optional

- [bat](https://github.com/sharkdp/bat#readme)
- [fd](https://github.com/sharkdp/fd)
- [lazygit](https://github.com/jesseduffield/lazygit#readme)
- [neovim](https://github.com/neovim/neovim#readme)
- [ripgrep](https://github.com/BurntSushi/ripgrep#readme)
- [tmux](https://github.com/tmux/tmux#readme)
- terminal emulator with patched [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts#readme), [installation example](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack#linux)

### Plugins 

- [git submodules](.gitmodules)
- [nvim-basic-ide](https://github.com/michalsvorc/nvim-basic-ide#readme)

Installed by [initialization](scripts/init.sh) script:

- [fzf-tab](https://github.com/Aloxaf/fzf-tab#readme)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting#readme)

## Usage

Clone with submodules flag:

```shell
git clone --recurse-submodules
```

Run initialization script:

```shell
./scripts/init.sh
```
