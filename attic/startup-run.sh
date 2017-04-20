#!/bin/sh -x

cd "$(dirname $0)"

# To be called from /etc/service/ewindow/run Stuff to execute on boot by root user

modprobe bcm2835_v4l2

./service/peervpn/iproute2

# Make sure we can git pull
chown -R ewindow:ewindow .

# Prepare TAP device to run peervpn as user
#HOSTNAME=ewindow-$(cat /home/ewindow/config/id)
#hostname $HOSTNAME
#echo $HOSTNAME > /etc/hostname

./service/peervpn/iproute2

# Disable screen blanking
sh -c "TERM=linux setterm -blank 0 >/dev/tty0"

exec su ewindow -s /bin/sh -c "svscan ./service"