#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#


function scan_rasp() {
    MY_IP_MASK=`my_ip_mask`
    sudo nmap -sn $MY_IP_MASK | grep Raspberry -B2
}