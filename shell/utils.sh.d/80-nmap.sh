#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#


function nmap_scan_rasp() {
    MY_IP_MASK=`my_ip_mask`
    sudo nmap -sn --min_parallelism 20 $MY_IP_MASK | grep Raspberry -B2
}

function nmap_update_mactable() {
    wget https://raw.githubusercontent.com/nmap/nmap/master/nmap-mac-prefixes && sudo mv nmap-mac-prefixes /usr/share/nmap/nmap-mac-prefixes
}

function nmap_find_mac_vendor() {
    for mac in $@; do
      mac=`echo "$mac" | tr -d ':' | tr -d '-'`
      grep -i $mac /usr/share/nmap/nmap-mac-prefixes
    done
}
