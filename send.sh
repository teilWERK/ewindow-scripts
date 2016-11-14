#!/bin/sh -ex

cd $(dirname $0)

#HOST=$(cat host)
#PORT=$(cat port)

HOST="$1"
PORT=5555

# If use raspicam
# sudo modprobe bcm2835_v4l2
#gst-launch-1.0 -vvv v4l2src ! "video/x-raw,width=640,height=480" !  omxh264enc ! "video/x-h264,profile=baseline" ! h264parse ! rtph264pay pt=96 config-interval=1 ! udpsink host=localhost port=6666
exec gst-launch-1.0 -vvv autovideosrc ! "video/x-raw,width=640,height=480" ! omxh264enc target-bitrate=2000000 control-rate=1  ! "video/x-h264,profile=high" ! h264parse ! rtph264pay pt=96 config-interval=1 !  udpsink host=$HOST port=$PORT

