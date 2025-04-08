# Base Options
echo Greetings, Nathan

# Paths
export PATH=$PATH:$HOME/go/bin
export PATH="$HOME/.local/bin:$PATH"

# MacOS Paths
if [[ $(uname) == "Darwin" ]]; then 
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/emulator
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  export BW_SESSION="ViJXlHjiRD6HyuhUf+FqL9sdedolJsHAQ4jL43L/GbjZc+p0BQaFiXSe5zCKLiUY84WSC+Fh1QUIU1d9/9SIJQ=="
fi

# Linux Paths
if [[ $(uname) == "Linux" ]]; then 
  export ANDROID_HOME=$HOME/android_sdk
  export PATH=$PATH:$HOME/android_sdk/cmdline-tools/tools/bin
  export PATH=$PATH:/mnt/c/Users/Cadra/AppData/Local/Android/Sdk/platform-tools
fi

# Homebrew
if [[ $(uname) == "Darwin" ]]; then 
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export HOMEBREW_CASK_OPTS=--no-quarantine
fi

# Set Zinit dir
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Install Zinit if it hasn't been
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone http://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source zinit
source "${ZINIT_HOME}/zinit.zsh"

# Node Version Manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Case Insensitive 
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"
zstyle ":completion:*" menu no
zstyle ":fzf-tab:complete:cd:*" fzf-preview "ls --color $realpath"
zstyle ":fzf-tab:complete:__zoxide_z:*" fzf-preview "ls --color $realpath"

# Aliases
alias vim="nvim"
alias listdisks="sudo lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL"
alias img="wezterm imgcat"
alias gg="git log --oneline --abbrev-commit --all --graph --decorate --color"

# Linux only alias
if [[ $(uname) == "Linux" ]]; then 
  alias bat="batcat"
  alias emulator="/mnt/c/Users/Cadra/AppData/Local/Android/Sdk/emulator/emulator -avd Pixel_9_Pro_API_35"
  alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --group-directories-first --all"
  alias lst="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --group-directories-first --all --tree -L"
fi

# MacOs only alias
if [[ $(uname) == "Darwin" ]]; then 
  alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --group-directories-first --all" 
  alias lst="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --group-directories-first --all --tree -L" 
fi

# Starship - end of zshrc
eval "$(starship init zsh)"

# Shell integrations
source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"

# pnpm
export PNPM_HOME="/home/cadra/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

#pyenv
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
  echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
  echo 'eval "$(pyenv init - zsh)"' >> ~/.zshrc
#pyenv end


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
