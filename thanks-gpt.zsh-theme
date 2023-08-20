# Function to get the AWS profile or default if not set
function aws_profile_prompt() {
  local aws_profile="${AWS_PROFILE:-default}"
  echo "| aws:${aws_profile}"
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

NEWLINE=$'\n'
PROMPT='%(?,%{$fg[white]%},%{$fg_bold[red]%})%n %{$fg[white]%}[%*]%{$reset_color%} $(aws_profile_prompt)$(git_prompt_info) | %{$fg[blue]%}%~%{$reset_color%}${NEWLINE}%(!.#.❯) '

ZSH_THEME_GIT_PROMPT_PREFIX="| %{$fg[green]%}git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
