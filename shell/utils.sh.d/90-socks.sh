#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#

function socks5() {
    case $1 in
        ali )
            case $2 in
                start )
                    if [[ ! `pgrep -f '127.0.0.1:8887'` ]]; then
                        ssh -qTfnN -D 127.0.0.1:8887 root@aliyun_tribf_01
                    fi
                    ;;
            esac
            ;;
        * )
            echo
            echo "$0 <name> <start|stop>"
            echo
            ;;
    esac
}
