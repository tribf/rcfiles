#!/usr/bin/env bash

function list_tunnels() {
    echo "Available tunnels:"
    for t in $TUNNEL_DIR/*.tunnel ; do
        echo "    `basename $t .tunnel`"
        source $t
        for ((i = 0; i < ${#tunnels[@]}; i++))
        do
            echo "        ${tunnels[$i]}"
        done
    done
}

function usage()
{
    echo ""
    echo "ssh auto establish script"
    echo ""
    echo "Usage: `basename $0` -t <tunnel_name> -c <on|off|show>"
    echo ""
    echo "Options:"
    echo "    -t <tunnel_name>      target tunnel name"
    echo "    -c <on|off|show>      command to execute"
    echo "    -h                    Show this text"
    echo ""

    list_tunnels
}

function parse_args() {
    while getopts ":lt:c:h" opt; do
        case $opt in
            l)
                list_tunnels
                exit 0
                ;;
            t)
                tunnel_name=${OPTARG}
                echo "tunnel: $tunnel_name"
                tunnel_file=$(readlink -f $TUNNEL_DIR/${tunnel_name}.tunnel)
                ;;
            c)
                command=$OPTARG
                ;;
            h)
                usage
                exit 0
                ;;
            \?)
                echo -e "\nUnrecognized option: -$OPTARG\n" >&2
                exit 1
                ;;
            :)
                echo -e "\nArgument required for argument -${OPTARG}.\n" >&2
                exit 1
                ;;
        esac
    done

    if [ "$tunnel_name" == "" ]; then
        echo -e "\nError: tunnel (-t) is required\n" >&2
        list_tunnels
        exit 1
    fi

    if [ ! -f "${tunnel_file}" ]; then
        echo "Could not find tunnel $tunnel_name." >&2
        list_tunnels
        return 1
    fi

    if [ "$command" == "" ]; then
        echo -e "\nError: command (-c) is required\n" >&2
        exit 1
    fi
}


SCRIPT_FILE=$BASH_SOURCE
SCRIPT_FILE_PATH=`readlink -f $SCRIPT_FILE`
SCRIPT_HOME=`dirname "$SCRIPT_FILE_PATH"`
TUNNEL_DIR=$SCRIPT_HOME/ssh_auto_list

parse_args $*

source ${tunnel_file}

case $command in
    on )
        for ((i = 0; i < ${#tunnels[@]}; i++))
        do
            tunnel=${tunnels[$i]}
            PID=`pgrep -f "$tunnel"`
            if [[ ! $PID ]]; then
                eval $tunnel
            else
                echo "tunnel exists pid:$PID"
                echo "$tunnel"
                echo ""
            fi
        done
    ;;

    off )
        for ((i = ${#tunnels[@]} - 1; i >= 0; i--))
        do
            tunnel=${tunnels[$i]}
            PID=`pgrep -f "$tunnel"`
            if [[ $PID ]]; then
                echo "tunnel exists pid:$PID, now kill"
                echo "$tunnel"
                echo ""
                kill $PID
            fi
        done
    ;;
    show )
        for ((i = 0; i < ${#tunnels[@]}; i++))
        do
            echo ${tunnels[$i]}
        done
    ;;
    * )
        echo -e "\nError: Invalid Command (\"$command\")\n" >&2
        usage
    ;;
esac
