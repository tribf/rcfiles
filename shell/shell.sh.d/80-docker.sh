#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#


#=============================================================================
# image:neural-enhance 
#=============================================================================
function ne() {
    docker run --rm -v "$(pwd)/`dirname ${@:$#}`":/ne/input -it alexjc/neural-enhance ${@:1:$#-1} "/ne/input/`basename ${@:$#}`";
}

alias enhance='ne'
# enhance --zoom=1 --model=repair images/broken.jpg

