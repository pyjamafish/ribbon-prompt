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


function () {
    # Set the ribbon color (1-6).
    local ribbon_color=4
    # Helper strings.
    local dir="%~"
    local newline=$'\n'
    local ribbon_bg=$(tput setab ${ribbon_color})
    # Set fg to bg color.
    # https://stackoverflow.com/a/24198187/14106506
    local ribbon_end=$(tput sgr0; tput setaf ${ribbon_color}; tput smso)

    # The prompt proper.
    export PS1="${newline}%{${ribbon_bg}%}%(1V.(%1v) .)${dir} %{${ribbon_end}%}%{$(tput sgr0)%}${newline}$ "
}
