#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#

function install_osx-arc() {
    sudo apt-get install gnome-themes-standard gnome-themes-standard-data gtk2-engines-pixbuf
    cd /tmp
    wget https://github.com/LinxGem33/OSX-Arc-Shadow/releases/download/v1.4.7/osx-arc-collection_1.4.7_amd64.deb
    sudo dpkg -i osx-arc-collection_1.4.7_amd64.deb
}
