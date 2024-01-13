#!/bin/bash

rm ./out/target/product/satsuki/lineage-18.1-*-UNOFFICIAL-satsuki.*

#export USE_CCACHE=1
#export CCACHE_EXEC=/usr/bin/ccache
#ccache -M 50G
#ccache -o compression=true
#source build/envsetup.sh

. ./LineageOS_InitForBuild.sh

breakfast satsuki
brunch satsuki
