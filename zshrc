# oh-my-zsh config
export ZSH=$HOME/.oh-my-zsh
DISABLE_UPDATE_PROMPT=true
ZSH_THEME="davedissian"
plugins=(git brew osx rust cargo)
source $ZSH/oh-my-zsh.sh

# Cargo
export PATH=$PATH:$HOME/.cargo/bin

# Editor
export EDITOR=vim
export VISUAL=$EDITOR

# Dir colours
if ls --color -d . >/dev/null 2>&1; then
    eval `dircolors $HOME/.dotfiles/dir_colors`
fi

# Projects
export PROJECTS_HOME="$HOME/Work/Projects"

# Go
# The GOPATH is set to where we want global go libraries to be installed. Projects should append
# their src path to the GOPATH.
export GOPATH="$HOME/.go"

# Enable Virtualenv Wrapper
export WORKON_HOME="$HOME/.virtualenvs"
export PROJECT_HOME=$PROJECTS_HOME
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    source /usr/bin/virtualenvwrapper.sh
elif [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
elif [ -f $HOME/.local/bin/virtualenvwrapper.sh ]; then
    source $HOME/.local/bin/virtualenvwrapper.sh
fi

# Aliases
alias pd="pushd"
alias la="ls -lhA"
alias ll="ls -lh"
alias gl="git log --graph --all"
alias gb="git branch --all"
alias grep="grep --color=auto"
alias which_doc_shell="for i in {1..4}; do ssh da913@shell\$i.doc.ic.ac.uk 'echo -n \"\`hostname -s\`: \" && who | wc -l'; done"
if hash xdg-open 2>/dev/null; then
  alias open="xdg-open"
fi
alias pacman="yaourt"

# Functions
function mkcd {
    dir="$*"
    mkdir -p "$dir" && cd "$dir"
}

function aur_install {
    pushd /tmp
    curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz &&
    tar xf $1.tar.gz &&
    cd $1 &&
    makepkg -sri
    popd
}

# zsh local config
if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi
