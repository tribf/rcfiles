#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#

# export QUARTUS_INSTALL_DIR=$HOME/intelFPGA_lite/18.1
export QUARTUS_INSTALL_DIR=/opt/intelFPGA/18.1
export SOPC_KIT_NIOS2="$QUARTUS_INSTALL_DIR/quartus/sopc_builder"
export QSYS_ROOTDIR="$QUARTUS_INSTALL_DIR/quartus/sopc_builder/bin"
export QUARTUS_ROOTDIR="$QUARTUS_INSTALL_DIR/quartus"
export NIOS2EDS_ROOTDIR="$QUARTUS_INSTALL_DIR/nios2eds"
export NIOS2EDS_SDK_ROOTDIR="$QUARTUS_INSTALL_DIR/nios2eds/sdk2"

export PATH=$QUARTUS_ROOTDIR/bin:$PATH
export PATH=$QSYS_ROOTDIR:$PATH
export PATH=$NIOS2EDS_ROOTDIR/bin:$PATH
export PATH=$NIOS2EDS_ROOTDIR/bin/gnu/H-x86_64-pc-linux-gnu/bin:$PATH
export PATH=$NIOS2EDS_SDK_ROOTDIR/bin:$PATH

export PATH=$QUARTUS_INSTALL_DIR/modelsim_ase/bin:$PATH

export GHDL_HOME="$HOME/app/ghdl"
export PATH=$GHDL_HOME/bin:$PATH
