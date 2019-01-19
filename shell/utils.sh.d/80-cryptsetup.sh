#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#


function crypt_img() {
    IMG=/home/tribf/tribfworkspace/tribf.iso
    MAPPER=/dev/mapper/tribfVolume
    DISK=/media/tribf/tribf_disk

    case $1 in
        load )
            if [[ -e $MAPPER ]]; then
                echo ""
                echo "encrypted image($MAPPER) already mapped"
                echo ""
            else
                if [[ -e $IMG ]]; then
                    sudo cryptsetup -y luksOpen $IMG tribfVolume
                    sudo mount $MAPPER $DISK
                    sudo chown tribf:tribf $DISK -R
                else
                    echo ""
                    echo "encrypted image($IMG) not exist"
                    echo ""
                fi
            fi
            ;;
        unload )
            sudo umount $DISK
            sudo cryptsetup -y luksClose tribfVolume
            ;;
        cd )
            cd $DISK
            ;;
        * )
            echo
            echo "$0 [load|unload|cd]"
            echo
            ;;
    esac
}
