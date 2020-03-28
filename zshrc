# Platform detection: https://stackoverflow.com/a/8597411

# oh-my-zsh config
export ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh
DISABLE_UPDATE_PROMPT=true
ZSH_THEME="dga"
plugins=(git rust cargo)
if [[ "$OSTYPE" == "darwin"* ]]; then
    plugins+=(brew osx)
fi
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

# Native symlinks on Windows
if [[ "$(uname -s)" =~ MSYS ]]; then
    export MSYS=winsymlinks:nativestrict
fi

# Go
# The GOPATH is set to where we want global go libraries to be installed. Projects should append
# their src path to the GOPATH
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

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

# direnv
if hash direnv 2>/dev/null; then
    eval "$(direnv hook zsh)"
fi

# Aliases
alias pd="pushd"
if [[ "$(uname -s)" =~ MSYS ]]; then
    alias ls="ls -I NTUSER.DAT\* -I ntuser.dat\* -I ntuser.ini"
fi
alias la="ls -lhA"
alias ll="ls -lh"
alias gl="git log --graph --all"
alias gb="git branch --all"
alias grep="grep --color=auto"
if [[ "$(uname -s)" =~ MSYS ]]; then
    alias open="start"
fi
if hash xdg-open 2>/dev/null; then
    alias open="xdg-open"
fi
if hash yay 2>/dev/null; then
    alias pacman="yay"
fi

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
