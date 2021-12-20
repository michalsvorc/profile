# GNU/Linux profile configuration files  

## Usage

Clone the repository to `$HOME/.local/profile` and create softlinks in your `$HOME` directory.



## Shells

### Shared shell profile vs. Local shell profile

Shared shell profile in `shell/profile.sh` is sourced automatically from shell `rc` files.

Put user specific configuration to `$HOME/.profile` and create a symlink in `$HOME` directory.

Bash: `ln -s $HOME/.profile $HOME/.bash_profile`
Zsh:  `ln -s $HOME/.profile $HOME/.zprofile`

### Bash

```console
$ config=bashrc;  ln -s "$HOME/.local/profile/${config}.sh" "$HOME/.${config}"
$ config=logout;  ln -s "$HOME/.local/profile/${config}.sh" "$HOME/.bash_${config}"
```

### Zsh

```console
$ config=zshrc;   ln -s "$HOME/.local/profile/${config}.sh" "$HOME/.${config}"
$ config=logout;  ln -s "$HOME/.local/profile/${config}.sh" "$HOME/.z${config}"
```

#### [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

Fish shell-like syntax highlighting for Zsh.

```console
$ mkdir -p "$HOME/.local/share/zsh/" \
  ; git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  "$HOME/.local/share/zsh/zsh-syntax-highlighting"
```

#### [fzf-tab](https://github.com/Aloxaf/fzf-tab)

Replace zsh's default completion selection menu with fzf.

```console
$ mkdir -p "$HOME/.local/share/zsh/" \
  ; git clone https://github.com/Aloxaf/fzf-tab.git \
  "$HOME/.local/share/zsh/fzf-tab"
```

## Tmux

### [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

```console
$ mkdir -p "$HOME/.local/share/tmux/" \
  ; git clone https://github.com/tmux-plugins/tpm.git \
  "$HOME/.local/share/tmux/tpm"
```

## Awesome WM

Create softlinks for `plugins` and `themes` in `.config/plugins/awesome`.

Point them to the directories with your awesome wm plugins and themes.

## Neovim

1. Start by executing `nvim` or `edit` alias.
2. Package manager should be installed on the first run.
3. Run `:PackerInstall` vim command.

### Package install fails

1. Remove failed packages from `~/.local/share/nvim/site/pack/packer/start/`
2. Rerun the `:PackerInstall` vim command.
