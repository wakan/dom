#!/bin/bash
MEMUSG=$(cat /tmp/dom.fromscript.memory_logging.val)
#save memory usage to domoticz, replace with you IP, Portnumber and IDX
OUTPUT=`curl -k "https://192.168.1.18/json.htm?type=command&param=udevice&idx=9&nvalue=0&svalue=$MEMUSG"`
