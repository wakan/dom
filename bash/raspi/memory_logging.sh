#!/bin/bash
#Retrieve memory usage of the system in percentage
MEMUSG=`free -m|grep "Mem"|awk '{print $3/($4+$3) * 100}'`
echo $MEMUSG > /tmp/dom.fromscript.memory_logging.val
