#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#

#=============================================================================
# WELCOME BANNER
#=============================================================================

type figlet > /dev/null 2>&1
if [[ $? == 0 ]]; then
    figlet -w 80 Be In Focus
fi


type linuxlogo > /dev/null 2>&1
if [[ $? == 0 ]]; then
    linuxlogo -L ubuntu -y -u -ascii
fi


echo -e "${CYAN}This is ${RED}$SHELL${CYAN} @${RED}" "`date`" "${NC}"
