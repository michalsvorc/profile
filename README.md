# GNU/Linux profile configuration files  

## Usage

Clone the repository to `$HOME/.local/profile` and create softlinks in your `$HOME` directory.

## Shells

### Bash

```console
$ config=profile; ln -s "$HOME/.local/profile/$config" "$HOME/.bash_${config}"
$ config=bashrc;  ln -s "$HOME/.local/profile/$config" "$HOME/.${config}"
$ config=logout;  ln -s "$HOME/.local/profile/$config" "$HOME/.bash_${config}"
```

### Zsh

```console
$ config=profile; ln -s "$HOME/.local/profile/$config" "$HOME/.z${config}"
$ config=zshrc;   ln -s "$HOME/.local/profile/$config" "$HOME/.${config}"
$ config=logout;  ln -s "$HOME/.local/profile/$config" "$HOME/.z${config}"
```

#### zsh-syntax-highlighting

Fish shell-like syntax highlighting for Zsh.

```console
$ mkdir -p "$HOME/.local/share/zsh/" \
  ; git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  "$HOME/.local/share/zsh/zsh-syntax-highlighting"
```

## Tmux

### Tmux Plugin Manager

```console
$ mkdir -p "$HOME/.local/share/tmux/" \
  ; git clone https://github.com/tmux-plugins/tpm.git \
  "$HOME/.local/share/tmux/tpm"
```

