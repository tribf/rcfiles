#!/usr/bin/env bash

###############################################################################
# @file:    check_network_connection.sh
# @brief:   use http request to check the network connection status
# @author:  tribf tribf@tribf.com
# @version: 1.0
# @date:    2018-06-04
# @note:    It requires the installed packages curl sox libsox-fmt-all cron
#
#           1. copy this script to /home/feeyo/app/check_network_connection.sh
#           2. copy warning.wav to /home/feeyo/app/warning.wav
#           3. chmod a+x /home/feeyo/app/check_network_connection.sh
#           4. crontab -e, and add the following line
#               * * * * * /home/feeyo/app/check_network_connection.sh
###############################################################################

TEST_HOST="http://www.baidu.com"

#=============================================================================
# set SCRIPT_HOME
#=============================================================================
SCRIPT_FILE=$BASH_SOURCE
SCRIPT_FILE_PATH=`readlink -f $SCRIPT_FILE`
SCRIPT_HOME=`dirname "$SCRIPT_FILE_PATH"`

alarm() {
# sudo apt-get install sox libsox-fmt-all
    play ${SCRIPT_HOME}/check_network_connection_warning.mp3
}

case "$(curl -s --max-time 2 -I ${TEST_HOST} | sed 's/^[^ ]*  *\([0-9]\).*/\1/; 1q')" in
    [23] )
        echo ""
        echo "[OK] network is connected"
        echo ""
        ;;
    *)
        echo ""
        echo "[ERROR] something wrong with the network !!!"
        echo ""

        alarm
        ;;
esac
