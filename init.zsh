# Set the ribbon color (1-6).
ribbon_color=4


# Helper strings.
dir="%~"
newline=$'\n'
ribbon_bg=$(tput setab ${ribbon_color})
# Set fg to bg color.
# https://stackoverflow.com/a/24198187/14106506
ribbon_end=$(tput sgr0; tput setaf ${ribbon_color}; tput smso)


# Disable built-in virtualenv prompt.
# https://askubuntu.com/a/387098
export VIRTUAL_ENV_DISABLE_PROMPT=yes

function virtenv_indicator {
    if [[ -z $VIRTUAL_ENV ]]; then
        psvar[1]=''
    else
        psvar[1]=${VIRTUAL_ENV##*/}
    fi
}
add-zsh-hook precmd virtenv_indicator


# The prompt proper.
PS1="${newline}%{${ribbon_bg}%}%(1V.(%1v) .)${dir} %{${ribbon_end}%}%{$(tput sgr0)%}${newline}$ "

