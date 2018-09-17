#!/bin/bash
#Retrieve memory usage of the system in percentage
CPUUSG=`echo $[100-$(vmstat 1 2|tail -1|awk '{print $15}')]`
echo $CPUUSG > /tmp/dom.fromscript.cpu_logging.val
