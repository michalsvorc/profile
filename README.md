# GNU/Linux profile configuration files  

## Usage

Clone the repository to `$HOME/.local/profile` and create softlinks in your `$HOME` directory.

## Shells

### Bash

```console
$ config=profile; ln -s "$HOME/.local/profile/$config" ".${config}"
$ config=bashrc;  ln -s "$HOME/.local/profile/$config" ".${config}"
```

### Zsh

```console
$ config=profile; ln -s "$HOME/.local/profile/$config" ".z${config}"
$ config=zshrc;   ln -s "$HOME/.local/profile/$config" ".${config}"
```
