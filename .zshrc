# Base Options
echo Greetings, Nathan

# Paths
export PATH=$PATH:$HOME/go/bin
export PATH="$HOME/.local/bin:$PATH"

# MacOS Paths
if [[ $(uname) == "Darwin" ]]; then 
  export BW_SESSION="ViJXlHjiRD6HyuhUf+FqL9sdedolJsHAQ4jL43L/GbjZc+p0BQaFiXSe5zCKLiUY84WSC+Fh1QUIU1d9/9SIJQ=="
  export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

  # The following lines have been added by Docker Desktop to enable Docker CLI completions.
  fpath=(/Users/cadra/.docker/completions $fpath)
  autoload -Uz compinit
  compinit
# End of Docker CLI completions
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

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
# autoload -U compinit && compinit

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
alias grep="rg"
alias find="fd"
alias listdisks="sudo lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL"
alias gg="git log --oneline --abbrev-commit --all --graph --decorate --color"
alias ls="lsd --group-directories-first --long --almost-all --git --blocks=permission,name"
alias lst="lsd --group-directories-first --long --almost-all --git --blocks=permission,name --tree --depth"


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
#
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Starship - end of zshrc
eval "$(starship init zsh)"


# bun completions
[ -s "/Users/cadra/.bun/_bun" ] && source "/Users/cadra/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
