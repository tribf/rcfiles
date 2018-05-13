#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#


function greppid() {
    KEY=$1
    ps -ef | grep $KEY | grep -v grep | awk '{print $2}'
}

function findpid() {
    KEY=$1
    eval 'pgrep -fo "${KEY}"'
}
