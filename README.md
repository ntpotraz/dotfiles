# dotfiles

Dotfiles for my terminal, nvim, vscode, and whatever else using GNU stow

## Requirements

Nerdfonts: https://github.com/ryanoasis/nerd-fonts/releases
- VictorMono
- Iosevka
- Iosevka Term

### macOS

- brew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- git
- gh
- lazygit
- stow
- zoxide
- wget
- tmux
- starship

If lazygit config doesn't work, run

```bash
export XDG_CONFIG_HOME="$HOME/.config"
```

### Linux

```bash
sudo apt-get update && sudo apt-get upgrade
```

- git
- stow
- zsh
- zoxide
- tmux
- cmake
- fzf

```bash
sudo apt install git stow zsh zoxide tmux cmake fzf
```

- GitHub CLI

```bash
curl -sS https://webi.sh/gh | sh
```

- lazygit

```bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit && rm lazygit.tar.gz
```

### Setup SSH Key

You can use `gh auth login` to setup SSH with the Github CLI and skip the rest of this section or you can setup the SSH key manually.

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

Add public key to GitHub profile: https://github.com/settings/keys

```bash
ssh -T git@github.com
```

## Installation

Setup GitHub CLI

```bash
gh auth login
```

Clone the repo

```bash
git clone git@github.com:ntpotraz/dotfiles.git ~/.dotfiles/
cd .dotfiles
```

Create the symlinks from the .dotfiles folder

```bash
stow .
```

### ZSH Default Shell

```bash
chsh -s $(which zsh)
source ~/.zshrc
```

### Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install eza
cargo install git-delta
cargo install starship --locked
```

### Wezterm for Windows

Open an Administrator Powershell terminal and create a .config/ folder in user home folder

```bash
mkdir "$HOME\.config\"
```

Create a symlink for Windows in Powershell

```bash
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.config\wezterm" -Target "\\wsl$\ubuntu-24.04\home\cadra\.dotfiles\.config\wezterm\"
```

## NeoVim Setup

### Install Node Version Manager

https://github.com/nvm-sh/nvm

```bash
nvm install --lts
nvm use --lts
```

### Install Neovim

macOS

```bash
brew install neovim
```

Linux

```bash
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

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux
<Prefix> I
```

### Nerd Fonts

https://github.com/ryanoasis/nerd-fonts

## TODO

- Make some Homebrew 🤤 ☕️
