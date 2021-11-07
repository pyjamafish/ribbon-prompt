# Helper strings
dir="%~"
newline=$'\n'

# Disable built-in virtualenv prompt
# https://askubuntu.com/a/387098
export VIRTUAL_ENV_DISABLE_PROMPT=yes

function virtenv_indicator {
    if [[ -z $VIRTUAL_ENV ]] then
        psvar[1]=''
    else
        psvar[1]=${VIRTUAL_ENV##*/}
    fi
}
add-zsh-hook precmd virtenv_indicator

# The prompt proper
PS1="${newline}%{$(tput setab 4)%}%(1V.(%1v) .)${dir} %{$(tput setaf 0)%}%{$(tput sgr0)%}${newline}$ "

