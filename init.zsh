# Helper strings
dir="%~"
newline=$'\n'
autoload -U colors && colors

# The prompt proper
PS1="${newline}%{$bg[blue]%}${dir}%{$fg[black]%}%{$reset_color%}${newline}"

# Underline command
zle_highlight=(default:underline)

