#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#


function cmaket() {
    argument=${1:-"build"}

    case $argument in
        build )
            CURDIR=`pwd`
            if [[ `basename $CURDIR` == 'build' ]]; then
                cmake .. && make
            else
                mkdir build && cd build && cmake .. && make
            fi
            ;;
        clean )
            find ./ -name build | xargs -i rm {} -rf
            ;;
        help | * )
            echo "$0 [build|clean|help]"
            ;;
    esac
}