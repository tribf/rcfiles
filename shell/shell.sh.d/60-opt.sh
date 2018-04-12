#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#



case `basename $SHELL` in
    bash )
        # append to the history file, don't overwrite it
        shopt -s histappend

        # append to the history file, don't overwrite it
        shopt -s cdspell

        # check the window size after each command and, if necessary,
        # update the values of LINES and COLUMNS.
        shopt -s checkwinsize

        # use regex
        shopt -s extglob


        # check the window size after each command and, if necessary,
        # update the values of LINES and COLUMNS.
        shopt -s checkwinsize
        ;;
esac
