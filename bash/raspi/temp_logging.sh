#!/bin/bash
#Retrieve memory usage of the system in percentage
TEMPUSG=`vcgencmd measure_temp | cut -d= -f2 | cut -d\' -f1`
echo $TEMPUSG > /tmp/dom.fromscript.temp_logging.val
