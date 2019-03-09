#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#


export SOPC_KIT_NIOS2="$HOME/intelFPGA_lite/18.1/quartus/sopc_builder"
export QSYS_ROOTDIR="$HOME/intelFPGA_lite/18.1/quartus/sopc_builder/bin"
export QUARTUS_ROOTDIR="$HOME/intelFPGA_lite/18.1/quartus"
export NIOS2EDS_ROOTDIR="$HOME/intelFPGA_lite/18.1/nios2eds"
export NIOS2EDS_SDK_ROOTDIR="$HOME/intelFPGA_lite/18.1/nios2eds/sdk2"

export PATH=$QUARTUS_ROOTDIR/bin:$PATH
export PATH=$QSYS_ROOTDIR:$PATH
export PATH=$NIOS2EDS_ROOTDIR/bin:$PATH
export PATH=$NIOS2EDS_ROOTDIR/bin/gnu/H-x86_64-pc-linux-gnu/bin:$PATH
export PATH=$NIOS2EDS_SDK_ROOTDIR/bin:$PATH
