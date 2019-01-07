#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#


function fswebcam_snap() {
    fswebcam -r 1920x1080 --jpeg 85 -D 1 snap.jpg
}
