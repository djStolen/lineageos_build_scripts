#!/bin/bash

# Source: https://www.geeksforgeeks.org/how-to-use-exit-code-to-read-from-terminal-from-script-and-with-logical-operators/

# Check the phone if in recovery
adb devices | grep recovery
in_recovery=$?
if [ $in_recovery -ne 0 ]
then
	echo “Android Phone rebooting to recovery”
	adb reboot recovery
	exit_code=0 #Device in recovery
fi

# Wait the phone to go into recovery
while [ $in_recovery -ne 0 ]
do
	echo “Searching for ADB active device. Waiting 20 sec.”
	sleep 20
	adb devices | grep recovery
	in_recovery=$?
done

# Wipe the phone
rm TWRP_Report.txt
touch TWRP_Report.txt
echo “Android Phone in recovery”
adb shell twrp format data >> TWRP_Report.txt
adb shell twrp wipe cache >> TWRP_Report.txt
adb shell twrp wipe system >> TWRP_Report.txt
adb shell twrp wipe dalvik >> TWRP_Report.txt
echo “Activating ADB SIDELOAD”
x-terminal-emulator -e adb shell twrp sideload

./LineageOS_Beep.sh 2

# Sideload the phone
echo “Waiting 10 sec. Then engaging ADB SIDELOAD”
sleep 10
adb sideload out/target/product/satsuki/lineage-18.1*.zip
#adb sideload /home/dj/Projects/lineage-18.1-kernel3.10.23-20240109-UNOFFICIAL-satsuki.zip
sideload_result=0
echo “Waiting 10 sec. Then rebooting the phone if ADB SIDELOAD was successful.”
sleep 10

# Reboot the phone
if [ $sideload_result -eq 0 ]
then
	./LineageOS_Beep.sh 1
	adb reboot
fi

exit $exit_code
