##########---------- for pylon dev ----------###########
export PYLON_ROOT=/opt/pylon4
export GENICAM_ROOT=/opt/pylon4/genicam
export GENICAM_ROOT_V2_3=/opt/pylon4/genicam
export GENICAM_CACHE=~/tmp

export LD_LIBRARY_PATH=$PYLON_ROOT/lib64:$GENICAM_ROOT/bin/Linux64_x64:$GENICAM_ROOT/bin/Linux64_x64/GenApi/Generic:$LD_LIBRARY_PATH
