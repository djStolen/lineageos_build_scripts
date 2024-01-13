#!/bin/bash

number_of_beeps=$1
# Check if sox for beeping exists
# Source: https://www.reddit.com/r/linuxquestions/comments/2ek2yi/is_there_a_modern_alternative_to_the_beep_command/
which sox &>/dev/null
sox_not_existing=$?

if [ $sox_not_existing -eq 0 ]
then
	while [ $number_of_beeps -ne 0 ]
	do
		play -n synth 0.1 tri  1000.0 &>/dev/null
		#echo $number_of_beeps
		sleep 1
		((number_of_beeps=number_of_beeps-1))			# Source: https://linuxsimply.com/bash-scripting-tutorial/variables/usage/subtract-two-variables/
	done
fi
