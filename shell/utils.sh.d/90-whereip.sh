#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#


function whereip()
{
    argument=${1:-"where"}
    
    case $argument in
    where|ip|whereip|show)
        curl --silent http://ip.cn 2>&1
        ;;
    proxy|world|global)
        export HTTPS_PROXY=http://127.0.0.1:1080
        export HTTP_PROXY=http://127.0.0.1:1080
        export ALL_PROXY=http://127.0.0.1:1080
        echo "Setup Proxy Completed."
        ;;
    noproxy|unproxy|local|china)
        unset HTTPS_PROXY
        unset HTTP_PROXY
        unset ALL_PROXY
        echo "Cancel Proxy Completed."
        ;;
    *)
        echo "whereip show|proxy|noproxy"
        ;;
    esac
}
