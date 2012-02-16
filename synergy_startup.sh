#!/bin/sh
#*******************************************************************************
# File: synergy_startup.sh
# Author: AustinLinuxGuy
# Parameters:
# Description: Script to determine if my laptop is in a docking station and
#              if it is, startup synergy as either a client or a server, 
#              depending on location.
#
#*******************************************************************************

synergyServerIP=""

locationOneIP=""
locationTwoIP=""



# Find out of the lid is closed or open to see if we are docked
state=`cat /proc/acpi/button/lid/LID/state |awk '{ print $2}'`

# Find out what IP address is set
myIP=`/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`

# Only startup synergy if the laptop is docked
if [ $state = "closed" ]; then

	# Start up the client if we get the IP address for locationOneIP
	if [ $myIP = $locationOneIP ]; then
		/usr/bin/synergyc $synergyServerIP

	# Start up the server if we get the IP address for locationTwoIP
	elif [ $myIP = $locationTwoIP ]; then
		/usr/bin/synergys --conf /etc/synergy.conf
	fi

fi
