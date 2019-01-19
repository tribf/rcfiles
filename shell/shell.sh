
#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#

#=============================================================================
# get TRIBF_SHELL_HOME
#=============================================================================
case `basename $SHELL` in
    "zsh" )
        TRIBF_SHELL_FILE=${(%):-%N}
        ;;
    "bash" )
        TRIBF_SHELL_FILE=$BASH_SOURCE
        ;;
esac

TRIBF_SHELL_FILE_PATH=`readlink -f $TRIBF_SHELL_FILE`
export TRIBF_SHELL_HOME=`dirname "$TRIBF_SHELL_FILE_PATH"`
if [ -z "$TRIBF_SHELL_HOME" ] ; then
    echo
    echo "Error: TRIBF_SHELL_HOME environment variable is not defined correctly."
    echo
    exit 1
fi


#=============================================================================
# source components
#=============================================================================
for file in `ls $TRIBF_SHELL_HOME/shell.sh.d/*.sh`; do
    source $file
done


#=============================================================================
# source paths
#=============================================================================
for file in `ls $TRIBF_SHELL_HOME/path.sh.d/*.sh`; do
    source $file
done


#=============================================================================
# source utils
#=============================================================================
for file in `ls $TRIBF_SHELL_HOME/utils.sh.d/*.sh`; do
    source $file
done


#=============================================================================
# source dev utils
#=============================================================================
export DEV_UTIL_HOME=$TRIBF_SHELL_HOME/dev.sh.d
export PATH=$PATH:$DEV_UTIL_HOME


#=============================================================================
# source zsh
#=============================================================================
if [[ `basename $SHELL` == "zsh" ]]; then
    for file in `ls $TRIBF_SHELL_HOME/zsh.sh.d/*.sh`; do
        source $file
    done
fi


#=============================================================================
# source linux belief
#=============================================================================
source $TRIBF_SHELL_HOME/linux_belief.sh
