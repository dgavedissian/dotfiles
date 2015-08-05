local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

__time="$fg[blue]%D{%K:%M}$reset_color"
__userhost="%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[green]%}%m$reset_color"
__path="%{$fg[blue]%}%3~"
PROMPT=' $__time | $__userhost | $__path $(git_prompt_info)$reset_color
%B»%b '
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
