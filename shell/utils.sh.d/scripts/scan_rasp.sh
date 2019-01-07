#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#


MY_IP_MASK=`my_ip_mask`

# fping -a -r1 -g $MY_IP_MASK >/dev/null 2>&1
# arp -n |fgrep "b8:27:eb"

sudo nmap -sn $MY_IP_MASK | grep Raspberry -B2
