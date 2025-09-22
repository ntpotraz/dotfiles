# dotfiles

Dotfiles for my terminal, nvim, vscode, and whatever else using GNU stow

## Requirements

Nerdfonts: https://github.com/ryanoasis/nerd-fonts/releases
- VictorMono
- Iosevka
- Iosevka Term

### Webi Installer

```bash
curl -sS https://webi.sh/webi | sh; \
source ~/.config/envman/PATH.env
```

- git (Use package manager on Linux)
- gh
- delta
- lsd
- bat
- fd (git-aware find)
- rg (git-aware grep)
- golang
- ffmpeg
- Zoxide

```bash
webi gh delta lsd bat fd rg golang ffmpeg zoxide git
```

### macOS

- lazygit
- stow
- wget
- tmux
- starship
- openssl
- readline
- sqlite3
- xz
- zlib
- tcl-tk@8 
- libb2
- ImageMagick

```bash
brew install lazygit stow wget tmux starship openssl readline sqlite3 xz zlib imagemagick
```

If lazygit config doesn't work, run

```bash
export XDG_CONFIG_HOME="$HOME/.config"
```

### Linux

```bash
sudo apt-get update -y && sudo apt-get upgrade -y
```

- stow
- zsh
- tmux
- cmake
- fzf
- gh
- unzip
- ImageMagick
- git
Debian
- build-essential
Arch
- tk
- neovim
- base-devel

```bash
sudo apt install build-essential git stow zsh tmux cmake unzip fzf gh imagemagick -y
```

```bash
yay -S base-devel tk git stow zsh tmux cmake unzip fzf imagemagick neovim -y
```

- lazygit

```bash
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit && rm lazygit.tar.gz
```

### Install Python

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
uv python list
uv python install 3.xx.x
```


### Setup SSH Key

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

```bash
eval "$(ssh-agent -s)"
```

```bash
ssh-add ~/.ssh/id_ed25519
```

Add public key to GitHub profile: https://github.com/settings/keys

```bash
ssh -T git@github.com
```

## Installation

Clone the repo

```bash
git clone git@github.com:ntpotraz/dotfiles.git ~/.dotfiles/
cd .dotfiles
```

Create the symlinks from the .dotfiles folder

```bash
stow .
```

Authenticate with GitHub CLI

```bash
gh auth login
```

### ZSH Default Shell

```bash
chsh -s $(which zsh)
```

```bash
exec zsh
```

At this point, you might need to exit the shell completely and reconnect

### Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

```bash
cargo install starship --locked
```

### Wezterm for Windows

Open an Administrator Powershell terminal and create a .config/ folder in user home folder

```bash
mkdir "$HOME\.config\"
```

Create a symlink for Windows in Powershell

```bash
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.config\wezterm" -Target "\\wsl$\DISTRO_NAME\home\cadra\.dotfiles\.config\wezterm\"
```

## NeoVim Setup

### Install Node Version Manager

https://github.com/nvm-sh/nvm

```bash
nvm install --lts
```

```bash
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
```

```bash
sudo apt update
```

```bash
sudo apt install neovim
```

#### Dependencies

- npm neovim
- npm live-server
  - `npm install -g neovim live-server`

### Setup Tmux

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

```bash
tmux
```

```
<Prefix> I
```

### Nerd Fonts

https://github.com/ryanoasis/nerd-fonts

## TODO

- Make some Homebrew 🤤 ☕️
