# Base Options
neofetch
echo Greetings, Nathan

# Variables
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # Syntax for man pages

# Aliases
alias ls="exa -l -a -g --group-directories-first --no-user --no-time"
alias vim=nvim

# Custom Prompt
PROMPT='%1~ => ' # Right side prompt: RPROMPT

# $PATH Variables
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" #Add 'code' for VSCode

# Functions
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# Plugins

