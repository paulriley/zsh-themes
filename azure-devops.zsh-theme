# Function to get the Azure subscription or default if not set
function az_subscription_prompt() {
    # Check if az CLI is installed
    if command -v az >/dev/null 2>&1; then
        # Get the Azure subscription name, or return empty if none found
        local az_subscription="$(az account show --query name -o tsv 2>/dev/null || echo '')"
        # Only display if a subscription is active
        if [[ -n "${az_subscription}" ]]; then
            echo "%{$fg[cyan]%} | az:${az_subscription}%{$reset_color%}"
        fi
    fi
}

# Function to check if the Git branch is up-to-date
function git_status_prompt() {
    local git_status="$(git status --porcelain 2>/dev/null)"
    if [[ -z "${git_status}" ]]; then
        echo "%{$fg[green]%}"
    else
        echo "%{$fg[yellow]%}"
    fi
}

NEWLINE=$'\n'
PROMPT='%(?,%{$fg[white]%},%{$fg_bold[red]%})%n %{$fg[white]%}[%*]%{$reset_color%}$(az_subscription_prompt)$(git_prompt_info) | %{$fg[blue]%}%~%{$reset_color%}${NEWLINE}%(!.#.❯) '

ZSH_THEME_GIT_PROMPT_PREFIX=" | %{$fg[green]%}git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
