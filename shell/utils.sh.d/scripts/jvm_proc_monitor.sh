#!/usr/bin/env bash

function showusage() {
cat << EOF
    usage: $0 [<pid>][-h | --help]
EOF
}

function jvm_proc_monitor() {
    LOG_FILE=jvm_proc_monitor.log

    PROC_NAME=$1
    while [[ 1 ]]; do
        PROC_PID=`greppid ${PROC_NAME}`

        if [[ $PROC_PID ]]; then
            JvmMem=`jstat -gc ${PROC_PID} | awk '{print $2, $3, $5, $7, $9, $11}' | tail -1 | awk '{for(i=1;i<=NF;i++){SUM+=$i}} END{printf("%.2f",SUM)}'`
            date "+%Y-%m-%d %H:%M:%S" | tee -a ${LOG_FILE}
            echo PROC_PID ${PROC_PID} ${JvmMem} | tee -a ${LOG_FILE}
            ps -p ${PROC_PID} -o %mem,vsz,rsz | tee -a ${LOG_FILE}
        fi
        sleep 1
    done
}

case $1 in
    -h | --help )
        showusage
    ;;
    * )
        if [ -e $1 ];then
            echo "Error using $0"
            $0 -h
        else
            jvm_proc_monitor $1
        fi
    ;;
esac
