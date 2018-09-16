#!/bin/bash

source /home/pi/dom/bash/hue/var.sh
PONT_RESPONSE=`curl -H "Accept: application/json" "http://${HUE_IP_PONT}/api/${HUE_USER}/lights"`
echo $PONT_RESPONSE
CURRENT_ID_LAMP=1

ON=`echo $PONT_RESPONSE | jq .\"$CURRENT_ID_LAMP\".state.on`
echo $ON > /tmp/dom.fromscript.hue.lamp1.on
BRI=`echo $PONT_RESPONSE | jq .\"$CURRENT_ID_LAMP\".state.bri`
echo $BRI > /tmp/dom.fromscript.hue.lamp1.bri
XY=`echo $PONT_RESPONSE | jq .\"$CURRENT_ID_LAMP\".state.xy`
echo $XY > /tmp/dom.fromscript.hue.lamp1.xy
STATE_UPDATE=`echo $PONT_RESPONSE | jq .\"$CURRENT_ID_LAMP\".swupdate.state`
if [ $STATE_UPDATE = "readytoinstall" ]; then
	echo true > /tmp/dom.fromscript.hue.lamp1.update
elif [ $STATE_UPDATE = "noupdates" ]; then
	echo false > /tmp/dom.fromscript.hue.lamp1.update
else
	echo unkown > /tmp/dom.fromscript.hue.lamp1.update
fi

CURRENT_ID_LAMP=2

ON=`echo $PONT_RESPONSE | jq .\"$CURRENT_ID_LAMP\".state.on`
echo $ON > /tmp/dom.fromscript.hue.lamp2.on
BRI=`echo $PONT_RESPONSE | jq .\"$CURRENT_ID_LAMP\".state.bri`
echo $BRI > /tmp/dom.fromscript.hue.lamp2.bri
XY=`echo $PONT_RESPONSE | jq .\"$CURRENT_ID_LAMP\".state.xy`
echo $XY > /tmp/dom.fromscript.hue.lamp2.xy
STATE_UPDATE=`echo $PONT_RESPONSE | jq .\"$CURRENT_ID_LAMP\".swupdate.state`
if [ $STATE_UPDATE = "readytoinstall" ]; then
	echo true > /tmp/dom.fromscript.hue.lamp2.update
elif [ $STATE_UPDATE = "noupdates" ]; then
	echo false > /tmp/dom.fromscript.hue.lamp2.update
else
	echo unkown > /tmp/dom.fromscript.hue.lamp2.update
fi
