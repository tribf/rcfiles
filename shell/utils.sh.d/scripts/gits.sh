#!/usr/bin/env bash

case $1 in
    status )
        find . -mindepth 1 -maxdepth 2 -type d -name .git -print -exec git --git-dir={} --work-tree=$PWD/{}/.. status \;
        ;;
    pull )
        find . -mindepth 1 -maxdepth 2 -type d -name .git -print -exec git --git-dir={} --work-tree=$PWD/{}/.. pull \;
        ;;
    ppull )
        find . -mindepth 1 -maxdepth 2 -type d -name .git -print -exec proxychains git --git-dir={} --work-tree=$PWD/{}/.. pull \;
        ;;
    * )
        echo "$0 [status|pull|ppull]"
        ;;
esac
