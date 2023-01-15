# Base Options
neofetch
echo Greetings, Nathan
CASE_SENSITIVE='true'

# Variables
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # Syntax for man pages
export HOMEBREW_CASK_OPTS="--no-quarantine"

# Aliases
alias ls="exa -laFh --git --group-directories-first --no-user"
alias vim=nvim
alias clear="clear; neofetch"

# Custom Prompt
PROMPT='%1~ => ' # Right side prompt: RPROMPT

# $PATH Variables
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" # Add Visual Studio Code (code)

# Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# Plugins

