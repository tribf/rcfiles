#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#

function from_unixtime() {
    for time in $@; do
        timestr=`date -d @$time`
        echo "$time --> $timestr"
    done
}
