# dotfiles

Dotfiles for my terminal, nvim, vscode, and whatever else using GNU stow

## Requirements

### Linux

- git
- stow
- zsh
- zoxide

- cargo
  - eza
  - git-delta
 
- lazygit
```
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

- rustup
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

https://github.com/nvm-sh/nvm

### Tmux Package Manager

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
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

Setup Tmux

```
$ tmux source ~/.tmux.conf
$ vim ~/.dotfiles/.tmux.conf
<Prefix> I
```

## TODO

- Make some Homebrew 🤤 ☕️
