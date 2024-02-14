# dotfiles

Dotfiles for my terminal, nvim, vscode, and whatever else using GNU stow

## Requirements

### Linux

- git
- lazygit
- stow
- zsh

- cargo
  - eza
  - git-delta


```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### MacOS

- brew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- git
- lazygit
- stow
- eza

## Installation

Clone the repo

```
$ git clone git@github.com:ntpotraz/dotfiles.git ~/.dotfiles/
$ cd .dotfiles
```

Create the symlinks from the .dotfiles folder

```
$ stow .
```

## TODO

- Make some Homebrew 🤤 ☕️
