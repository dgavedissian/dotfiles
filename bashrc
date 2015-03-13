#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Editor
export VISUAL=vim
export EDITOR=$VISUAL

# mkcd
function mkcd {
  dir="$*"
  mkdir -p "$dir" && cd "$dir"
}

# Go
if hash go 2>/dev/null; then
  export GOPATH="$HOME/.go"
  export PATH="$PATH:$GOPATH/bin"
fi

# virtualenvwrapper
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME="$HOME/Projects"
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
  source /usr/bin/virtualenvwrapper.sh
fi
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi
if [ -f $HOME/.local/bin/virtualenvwrapper.sh ]; then
  source $HOME/.local/bin/virtualenvwrapper.sh
fi

# Aliases
alias pd="pushd"
alias ls="ls --color=auto"
alias la="ls -lhA"
alias ll="ls -lh"
alias gl="git log --graph --all"
alias gb="git branch --all"
alias grep="grep --color=auto"
alias which_doc_shell="for i in {1..4}; do ssh da913@shell\$i.doc.ic.ac.uk 'echo -n \"\`hostname -s\`: \" && who | wc -l'; done"
if hash xdg-open 2>/dev/null; then
  alias open="xdg-open"
fi

# Prompt Colours
RESET="\e[0m"         # Text Reset
BLACK="\e[0;30m"      # Black
RED="\e[0;31m"        # Red
GREEN="\e[0;32m"      # Green
YELLOW="\e[0;33m"     # Yellow
BLUE="\e[0;34m"       # Blue
PURPLE="\e[0;35m"     # Purple
CYAN="\e[0;36m"       # Cyan
WHITE="\e[0;37m"      # White

# Current git branch
function git_branch {
  local BRANCH=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD 2> /dev/null)
  if [ "$BRANCH" == HEAD ]; then
    local NAME=$(git name-rev --name-only HEAD 2> /dev/null)
    if [ "$NAME" != undefined ]; then
      echo -n "@$NAME"
    else
      git rev-parse --short HEAD 2> /dev/null
    fi
  else
    echo -n "$BRANCH"
  fi
}

# Formatted git branch prompt
function git_prompt {
  if git rev-parse --is-inside-work-tree &> /dev/null; then
    echo -ne "$RESET:$YELLOW$(git_branch)"
  fi
}

# Prompt
export CLICOLOR=1
export PROMPT_DIRTRIM=3
PS1="$YELLOW\u$RESET@$GREEN\h$RESET:$BLUE\w$RESET\`git_prompt\`$RESET\n\$ "

# Local bashrc
[[ -f ~/.bashrc.local ]] && . ~/.bashrc.local
