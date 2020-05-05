PROMPT='$(git_prompt_info)%{$fg[yellow]%}%#%{$reset_color%} '
RPROMPT='%{$fg[cyan]%}%~ %{$reset_color%}%(?,%{${fg[white]}%}⚪️,%{${fg_bold[red]}%}🔴) [%?]%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="$(git_remote_status)["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg[green]%}↓"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg[yellow]%}↑"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg[red]%}↕"

export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
