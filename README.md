# GNU/Linux profile configuration files  

## Usage

Clone the repository to `$HOME/.local/profile` and create softlinks in your `$HOME` directory.

## Shells

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

## Shared shell profile vs. Local shell profile

Shared shell profile in `shell/profile.sh` is sourced automatically from shell `rc` files.

Put user specific configuration to `$HOME/.profile` and create a symlink in `$HOME` directory.

Bash: `ln -s $HOME/.profile $HOME/.bash_profile`
Zsh:  `ln -s $HOME/.profile $HOME/.zprofile`

#### [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

Fish shell-like syntax highlighting for Zsh.

```console
$ mkdir -p "$HOME/.local/share/zsh/" \
  ; git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  "$HOME/.local/share/zsh/zsh-syntax-highlighting"
```

## Tmux

### [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

```console
$ mkdir -p "$HOME/.local/share/tmux/" \
  ; git clone https://github.com/tmux-plugins/tpm.git \
  "$HOME/.local/share/tmux/tpm"
```

