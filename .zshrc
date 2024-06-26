# Base Options
echo Greetings, Nathan

# Variables
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # Syntax for man pages
export HOMEBREW_CASK_OPTS="--no-quarantine"
export HOMEBREW_GITHUB_API_TOKEN='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'
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# $PATH Variables
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" # Add Visual Studio Code (code)
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# For go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Case Insensitive Completion
#zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
#autoload -Uz compinit && compinit


# Plugins (Don't use git for .zsh directory)
if [[ $(uname) == "Darwin" ]]; then
  export XDG_CONFIG_HOME="$HOME/.config"
  alias unmountcs='diskutil unmount force ~/Documents/Programming/School/Server && cd'
elif command -v apt > /dev/null; then
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

  alias bat="batcat"
  alias unmountcs='umount ~/Documents/Programming/School/Server/'
fi

alias ls="eza -lah --git --group-directories-first"
alias lst="eza -lahT --git --group-directories-first -L"
alias vim=nvim
alias neo="clear; neofetch"
alias cpp='clang++ -o run'
alias tmuxa='tmux a -t'
alias tmuxn='tmux new -s'
alias python='python3'
alias sshcs='sshfs potra002@empress.csusm.edu:/home/students/potra002 ~/Documents/Programming/School/Server && cd ~/Documents/Programming/School/Server'


eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/cadra/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/cadra/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/cadra/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/cadra/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

