#  _        _ _      __
# | |_ _ __| | |__  / _|
# | __| '__| | '_ \| |_
# | |_| |  |_| |_) |  _|
#  \__|_|  (_)_.__/|_|
#


function echo_gpu_high() {
    if [[ -e /sys/class/drm/card0/device/power_dpm_force_performance_level ]]; then
        sudo bash -c "echo 'high' > /sys/class/drm/card0/device/power_dpm_force_performance_level"
        sudo bash -c "echo 'performance' >  /sys/class/drm/card0/device/power_dpm_state"
    fi
}
