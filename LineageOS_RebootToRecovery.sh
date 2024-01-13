#!/bin/bash

# Source: https://www.geeksforgeeks.org/how-to-use-exit-code-to-read-from-terminal-from-script-and-with-logical-operators/

adb devices | grep recovery
in_recovery=$?
if [ $in_recovery -eq 0 ]
then
echo “Android Phone already in recovery”
adb shell twrp format data > TWRP_Report.txt
adb shell twrp wipe cache >> TWRP_Report.txt
adb shell twrp wipe system >> TWRP_Report.txt
adb shell twrp wipe dalvik >> TWRP_Report.txt
exit_code=0 #Device in recovery
else
echo “Android Phone rebooting to recovery”
adb reboot recovery
exit_code=16 #Device busy
fi

exit $exit_code
