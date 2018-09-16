#!/bin/bash
sudo arping -I eth0 -q -c4 192.168.1.11 -W 1
RESULT_CMD=$?
if [ $RESULT_CMD -eq 0 ] ; then 
	STATE_FIXE=11 
elif [ $RESUL_CMD -eq 1 ] ; then 
	STATE_FIXE=10 
else 
	STATE_FIXE=1 
fi
echo $STATE_FIXE > /tmp/dom.fromscript.arpping_tel_guillaume.val
sudo arping -I eth0 -q -c4 192.168.1.12 -W 1
RESULT_CMD=$?
if [ $RESULT_CMD -eq 0 ] ; then 
	STATE_FIXE=11 
elif [ $RESUL_CMD -eq 1 ] ; then 
	STATE_FIXE=10 
else 
	STATE_FIXE=1 
fi
echo $STATE_FIXE > /tmp/dom.fromscript.arpping_tel_marine.val
