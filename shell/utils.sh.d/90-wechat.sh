#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#


function wechat() {
    WECHAT_APP_BIN=$HOME/app/electronic-wechat-linux-x64/electronic-wechat
    WECHAT_APP_PID=`findpid ${WECHAT_APP_BIN##*/}`
    if [[ ! $WECHAT_APP_PID ]]; then
        [[ -s ${WECHAT_APP_BIN} ]] && nohup $WECHAT_APP_BIN > /dev/null 2>&1 &
    else
        echo
        echo "electronic-wechat started $WECHAT_APP_PID"
        echo
    fi
}
