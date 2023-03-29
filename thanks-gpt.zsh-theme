# Function to get the AWS profile or default if not set
function aws_profile_prompt() {
  local aws_profile="${AWS_PROFILE:-default}"
  echo "aws:${aws_profile}"
}

# Function to check if the Git branch is up-to-date
function git_status_prompt() {
  local git_status="$(git status --porcelain 2> /dev/null)"
  if [[ -z "${git_status}" ]]; then
    echo "%{$fg[green]%}"
  else
    echo "%{$fg[yellow]%}"
  fi
}

PROMPT='%(?,%{$fg[white]%},%{$fg_bold[red]%})%n %{$fg[white]%}[%*]%{$reset_color%} %{$fg[green]%}%c%{$reset_color%}$(git_prompt_info) $(aws_profile_prompt) %(!.#.❯) '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}git:%{$reset_color%}%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"

autoload -Uz add-zsh-hook

function prompt_git_status() {
  git_status="$(git status --porcelain 2> /dev/null)"
  git_branch="$(git_prompt_info)"
  if [[ -n "${git_branch}" ]]; then
    if [[ -z "${git_status}" ]]; then
      echo "%{$fg[green]%}"
    else
      echo "%{$fg[yellow]%}"
    fi
  else
    echo "%{$reset_color%}"
  fi
}

add-zsh-hook precmd prompt_git_status
