# dotfiles

Dotfiles for my terminal, nvim, vscode, and whatever else using GNU stow

## Requirements

### macOS

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
- tmux
- starship

If lazygit config doesn't work, run

```
export XDG_CONFIG_HOME="$HOME/.config"
```

- rustup
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Linux

```
sudo apt-get update && sudo apt-get upgrade
```

- git
- stow
- zsh
- zoxide
- tmux
- cmake
- fzf

   
```
sudo apt install git stow zsh zoxide tmux cmake fzf
```
 
- lazygit
```
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit && rm lazygit.tar.gz
```

### Setup SSH Key

```
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

## Installation

Clone the repo

```
git clone git@github.com:ntpotraz/dotfiles.git ~/.dotfiles/
cd .dotfiles
```

Create the symlinks from the .dotfiles folder

```
stow .
```

### ZSH Default Shell

```
chsh -s $(which zsh)
source ~/.zshrc
```

### Rust

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

cargo install eza
cargo install git-delta
cargo install starship --locked
```

## NeoVim Setup

### Install Node Version Manager

https://github.com/nvm-sh/nvm

```
nvm install --lts
nvm use --lts
```

### Install Neovim

macOS

```
brew install neovim
```

Linux

```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim
```

#### Dependencies

- ripgrep
  - `sudo apt install ripgrep`
- unzip
  - `sudo apt install unzip`
- npm neovim package
  - `npm install -g neovim`
- npm live-server
  - `npm install -g live-server`
- python neovim
  - `sudo apt install python3-neovim`
  - `sudo apt install python3.12-venv`

### Setup Tmux

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux
<Prefix> I
```

### Nerd Fonts

https://github.com/ryanoasis/nerd-fonts

## TODO

- Make some Homebrew 🤤 ☕️
