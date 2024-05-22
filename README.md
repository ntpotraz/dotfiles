# dotfiles

Dotfiles for my terminal, nvim, vscode, and whatever else using GNU stow

## Requirements

### Linux

- git
- lazygit
- stow
- zsh
- zoxide

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
- zoxide
- wget

If lazygit config doesn't work, run

```
export XDG_CONFIG_HOME="$HOME/.config"
```

### Install Node Version Manager

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

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
