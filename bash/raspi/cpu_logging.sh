#!/bin/bash
#Retrieve memory usage of the system in percentage
CPUUSG=`grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}'`
echo $CPUUSG > /tmp/dom.fromscript.cpu_logging.val
