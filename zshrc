# Base Options
neofetch
echo Greetings, Nathan

# Variables

# Aliases
alias ls="exa -l -a -g --group-directories-first --no-user --no-time"
alias vim=nvim

# Custom Prompt
PROMPT='%1~ => ' # Right side prompt: RPROMPT

# $PATH Variables

# Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# Plugins
