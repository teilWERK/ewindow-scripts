#!/bin/bash -ex

cd $(dirname $0) # Change working directory

# Stop Services, in case the previous dialog exited in error while displaying
#svc -d service/recv service/send

CHOICE=$(dialog --menu "$(hostname)" 20 100 10 \
	exit.ewindow.org	"strfry's Laptop" \
	dresden.ewindow.org	"RosenWerk Dresden" \
	mumalab.ewindow.org	 "Munich Maker Lab" \
	fablab-munich.ewindow.org	"FabLab Munich" \
	exodus.strfry.org	"Gateway (not Available)" \
#	zockers.ewindow.org	"Call Zockers E-window" \
	Exit "" \
	3>&1 1>&2 2>&3 )


case $CHOICE in
	Exit)
		;;
	Type)
		dialog --msgbox "Sorry. Not implemented yet..." 20 100
		;;
	*)
		clear
		baresip -6 -v -e d202@"$CHOICE"
		;;
esac

exec menu.sh