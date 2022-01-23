# GNU/Linux profile configuration files

## Requirements

- [exa](https://github.com/ogham/exa)
- [fzf](https://github.com/junegunn/fzf)

Optional:

- [lf](https://github.com/gokcehan/lf)
- Terminal emulator with patched [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts).
  See example for Hack typeface [installation](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack#linux).

## Usage

Clone this repository to `$HOME/.local/profile` and create desired softlinks in your `$HOME` directory.

Note that `$HOME/.local/profile` configuration files are without the hidden file `.` (dot) filename prefix.
You must enter the correct configuration filenames when creating softlinks in your `$HOME` directory.

## Git

Execute:

```console
$ file=gitconfig;   ln -s "$HOME/.local/profile/${file}" "$HOME/.${file}"
```

Configure Git username and email address:

```console
$ git config --global user.name "Your Name"
$ git config --global user.email "youremail@yourdomain.com"
```

## Shells

### Shell profile

`$HOME/.local/profile/shell/profile.sh` is sourced from all shell `rc` files and its configuration will be present in
all shells. You don't need to create softlinks for any `$HOME/.local/profile/shell` files.

Optionally, you can create a custom shared profile for variables that are not controlled by this repository:

```console
$ touch "$HOME/.profile"

# Bash
$ file=profile;  ln -s "$HOME/.${file}" "$HOME/.bash_${file}"

# Zsh
$ file=profile;  ln -s "$HOME/.${file}" "$HOME/.z${file}"
```

### Bash

```console
$ file=bashrc;  ln -s "$HOME/.local/profile/${file}.sh" "$HOME/.${file}"
$ file=logout;  ln -s "$HOME/.local/profile/${file}.sh" "$HOME/.bash_${file}"
```

### Zsh

```console
$ file=zshrc;   ln -s "$HOME/.local/profile/${file}.sh" "$HOME/.${file}"
$ file=logout;  ln -s "$HOME/.local/profile/${file}.sh" "$HOME/.z${file}"
```

- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting): Fish shell-like syntax highlighting
  for Zsh.

```console
$ mkdir -p "$HOME/.local/share/zsh/" \
  ; git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  "$HOME/.local/share/zsh/zsh-syntax-highlighting"
```

- [fzf-tab](https://github.com/Aloxaf/fzf-tab): Replace zsh's default completion selection menu with fzf.

```console
$ mkdir -p "$HOME/.local/share/zsh/" \
  ; git clone https://github.com/Aloxaf/fzf-tab.git \
  "$HOME/.local/share/zsh/fzf-tab"
```

## Tmux

- [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

```console
$ mkdir -p "$HOME/.local/share/tmux/" \
  ; git clone https://github.com/tmux-plugins/tpm.git \
  "$HOME/.local/share/tmux/tpm"
```

## Awesome WM

Read `./config/awesome/plugins/README.md`.

## Neovim

- [Packer](https://github.com/wbthomason/packer.nvim): Package manager.

1. Execute `nvim` command, the package manager should be installed on the first run.
2. Execute `:PackerInstall` command in Neovim.

- Configure Programming languages:

Edit `config/nvim/lua/languages.lua`.

### Troubleshooting

- Initial package installation fails:

1. Remove failed packages from `$HOME/.local/share/nvim/site/pack/packer/start/`
2. Execute `:PackerInstall` again.
