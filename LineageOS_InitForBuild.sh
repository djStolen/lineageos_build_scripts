#!/bin/bash

# Source: https://wiki.lineageos.org/devices/sumire/build

# Execute as, so everything runs in opened shell : LineageOS/android$ . ./<thisScript>.sh
# Source:https://stackoverflow.com/questions/16011245/source-files-in-a-bash-script

export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 50G
ccache -o compression=true
source build/envsetup.sh
