# Function to get cloud profile (AWS or Azure) if available
function cloud_profile_prompt() {
  local output=""
  
  # Check for AWS profile
  if [[ -n "${AWS_PROFILE}" ]]; then
    output="${output} | aws:${AWS_PROFILE}"
  fi
  
  # Check for Azure subscription
  local azure_subscription=""
  if command -v az &> /dev/null; then
    azure_subscription=$(az account show --query name -o tsv 2>/dev/null)
  fi
  
  if [[ -n "$azure_subscription" ]]; then
    output="${output} | azure:${azure_subscription}"
  fi
  
  echo "$output"
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
PROMPT='%(?,%{$fg[white]%},%{$fg_bold[red]%})%{$fg[cyan]%}%n@%m%{$reset_color%} %{$fg[white]%}[%*]%{$reset_color%}$(cloud_profile_prompt)$(git_prompt_info) | %{$fg[blue]%}%~%{$reset_color%}${NEWLINE}%(?,%(!.#.>),%(!.#.!)) '

ZSH_THEME_GIT_PROMPT_PREFIX=" | %{$fg[green]%}git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
