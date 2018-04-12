#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#

##########---------- set bash history ----------###########
export HISTTIMEFORMAT="%F %T "

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=999999
export HISTFILESIZE=999999

# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth

export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls:ll:pwd'
