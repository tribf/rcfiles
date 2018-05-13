#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#

function ssh2comp() {
    LPORT=19338
    RHOST=127.0.0.1
    RPORT=9338
    SSH_L_STR=${LPORT}:${RHOST}:${RPORT}
    SSH_D_STR=0.0.0.0:21060

    case $1 in
        con | connect )
            if [[ -z `findpid ${SSH_L_STR}` ]]; then
                ssh -fNg -o serveraliveinterval=60 -L ${SSH_L_STR} root@aliyun_tribf_01
            fi

            if [[ -z `findpid ${SSH_D_STR}` ]]; then
                ssh -qTfnN -D ${SSH_D_STR} -p ${LPORT} tribf@localhost
            fi
            ;;
        ssh )
            ssh -p ${LPORT} tribf@localhost
            ;;
        * )
            echo
            echo "$0 [con|ssh]"
            echo
            ;;
    esac

}
