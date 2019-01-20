#!/usr/bin/env bash

function ssh_r() {
    USAGE="${0##*/} ssh_r lport:user@rhost:rport <on|off|echo>"
    if [[ $# != 2 ]]; then
        echo $USAGE
    else
        L_PORT=`echo $1 | cut -d ':' -f 1`
        REMOTE_USERHOST=`echo $1 | cut -d ':' -f 2`
        R_PORT=`echo $1 | cut -d ':' -f 3`
        SSH_R_CMD="ssh -CqTfnN -R ${R_PORT}:localhost:${L_PORT} -p 22 ${REMOTE_USERHOST}"     
        PID=`pgrep -f "$SSH_R_CMD"`

        case $2 in
            on )
                if [[ ! $PID ]]; then
                    eval $SSH_R_CMD
                else
                    echo "ssh_r exists pid:$PID"
                    echo "$SSH_R_CMD"
                fi
                ;;
            off )
                if [[ $PID ]]; then
                    echo "ssh_r exists pid:$PID, now kill"
                    echo "$SSH_R_CMD"
                    kill $PID
                fi
                ;;
            echo )
                echo $SSH_R_CMD
                ;;
            * )
                echo $USAGE
                ;;
        esac
    fi
}

function ssh_d() {
    USAGE="${0##*/} ssh_d lport:user@rhost <on|off|echo>"
    if [[ $# != 2 ]]; then
        echo $USAGE
    else
        L_PORT=`echo $1 | cut -d ':' -f 1`
        REMOTE_USERHOST=`echo $1 | cut -d ':' -f 2`
        SSH_D_CMD="ssh -qTfnN -D 0.0.0.0:${L_PORT} -p 22 $REMOTE_USERHOST"

        PID=`pgrep -f "$SSH_D_CMD"`

        case $2 in
            on )
                if [[ ! $PID ]]; then
                    eval $SSH_D_CMD
                else
                    echo "ssh_d exists pid:$PID"
                    echo "$SSH_D_CMD"
                fi
                ;;
            off )
                if [[ $PID ]]; then
                    echo "ssh_d exists pid:$PID, now kill"
                    echo "$SSH_D_CMD"
                    kill $PID
                fi
                ;;
            echo )
                echo $SSH_D_CMD
                ;;
            * )
                echo $USAGE
                ;;
        esac
    fi
}

function ssh_l() {
    USAGE="${0##*/} ssh_l lport:target_host:target_port:mid_user@mid_host <on|off|echo>"
    if [[ $# != 2 ]]; then
        echo $USAGE
    else
        L_PORT=`echo $1 | cut -d ':' -f 1`
        T_HOST=`echo $1 | cut -d ':' -f 2`
        T_PORT=`echo $1 | cut -d ':' -f 3`
        REMOTE_USERHOST=`echo $1 | cut -d ':' -f 4`
        SSH_L_CMD="ssh -fNg -o serveraliveinterval=60 -L ${L_PORT}:${T_HOST}:${T_PORT} -p 22 $REMOTE_USERHOST"

        PID=`pgrep -f "$SSH_L_CMD"`

        case $2 in
            on )
                if [[ ! $PID ]]; then
                    eval $SSH_L_CMD
                else
                    echo "ssh_l exists pid:$PID"
                    echo "$SSH_L_CMD"
                fi
                ;;
            off )
                if [[ $PID ]]; then
                    echo "ssh_l exists pid:$PID, now kill"
                    echo "$SSH_L_CMD"
                    kill $PID
                fi
                ;;
            echo )
                echo $SSH_L_CMD
                ;;
            * )
                echo $USAGE
                ;;
        esac
    fi
}


case $1 in
    ssh_r | r )
        shift
        ssh_r $*
        ;;
    ssh_d | d )
        shift
        ssh_d $*
        ;;
    ssh_l | l )
        shift
        ssh_l $*
        ;;
    * )
        echo "${0##*/} <ssh_r|ssh_d|ssh_l> args"
        ;;
esac