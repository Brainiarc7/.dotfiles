##################
#  highlighting  #
##################

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]='none'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=167,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=142,underline'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=142,underline'
ZSH_HIGHLIGHT_STYLES[commandseparator]='none'
ZSH_HIGHLIGHT_STYLES[path]='underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]=''
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=''
ZSH_HIGHLIGHT_STYLES[globbing]='fg=blue'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=blue'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='none'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='none'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='none'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[assign]='none'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=208'
ZSH_HIGHLIGHT_STYLES[comment]='fg=245'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=142,bold'

typeset -A ZSH_HIGHLIGHT_PATTERNS
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf' 'fg=208,bold')
ZSH_HIGHLIGHT_PATTERNS+=('reset --hard' 'fg=208,bold')
