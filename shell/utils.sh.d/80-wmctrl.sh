#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#

function wmctrl_subl() {
    # NOTE:
    # set sublime settings "show_full_path": false

    winid=""

    wmctrl -l | grep "Sublime Text" | while read line ; do
        id=`echo $line | cut -d' ' -f1`
        worksapce=`echo $line | awk -F [\(\)] '{print "    "$2}' | grep $1`
        if [[ ! -z $worksapce ]]; then
            winid=$id
            break
        fi
    done

    if [[ "$winid" == ""  ]]; then
        echo "Can't find ST window: $1"
        wmctrl -l| grep "Sublime Text" | cut -d' ' -f5- | awk -F [\(\)] '{print "    "$2}'
    else
        wmctrl -i -R $winid
    fi
}