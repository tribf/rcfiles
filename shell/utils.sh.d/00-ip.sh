#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#


function my_ip() {
    # dev=`ip route get 8.8.8.8 | awk '{print $5}' | head -1`
    # dev=`route -n | grep '^0.0.0.0' | awk '{print $8}' | head -1`
    # ifconfig ${dev} | awk '/inet addr/ {print $2}' | sed -e s/addr://

    ip route get 8.8.8.8 | awk '{print $7}' | head -1
}

function my_ip_mask() {
    ip -o -f inet addr show | awk '/scope global/ {print $4}' | head -1
}
