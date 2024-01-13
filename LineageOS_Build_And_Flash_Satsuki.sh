#!/bin/bash

# Source: https://wiki.lineageos.org/devices/sumire/build

# Execute as, so everything runs in opened shell : LineageOS/android$ . ./<thisScript>.sh
# Source:https://stackoverflow.com/questions/16011245/source-files-in-a-bash-script

#adb reboot recovery
./LineageOS_RebootToRecovery.sh
rm ./out/target/product/satsuki/lineage-18.1-*-UNOFFICIAL-satsuki.*

# Init Build LOS for Sony XPERIA Z5 Premium a.k.a. Satsuki
. ./LineageOS_InitForBuild.sh

# BUILD LOS for Sony XPERIA Z5 Premium a.k.a. Satsuki
breakfast satsuki
brunch satsuki
brunch_result=$?

# Flash just built LOS on Satsuki
if [ $brunch_result -eq 0 ]
then
./LineageOS_Beep.sh 3
./LineageOS_FlashFreshLOS.sh
else
./LineageOS_Beep.sh 5
fi
