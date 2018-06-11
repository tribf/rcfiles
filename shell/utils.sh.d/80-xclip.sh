#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#

function xclip_abspath() {
    TMP=$1
    readlink -f ${TMP} | xclip -sel c
}

function xclip_file() {
    FILEPATH=`readlink -f $1`
    xclip -selection c -i ${FILEPATH}
}
