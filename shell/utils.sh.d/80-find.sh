#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#

function find_file() {
    find . -type f -iname '*'$*'*' -ls
}


function find_after_copy_from_ntfs() {
    find ./ -type d -perm 777 -print -exec chmod 755 {} \;
    find ./ -type f -perm 777 -print -exec chmod a-x {} \;
}
