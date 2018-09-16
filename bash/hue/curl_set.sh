#!/bin/bash

#./curl.sh <lampe> <intensite> <couleur> <duree_allumage>
#          lampe [0-x] id de la lampe dans le pont séparé par virgules
#          intensite [0-255]
#          couleur #RRGGBB hexa | [2500-7000]Kelvin
#          duree_allumage en dixieme de seconde

source /home/pi/dom/bash/hue/var.sh
INTENSITE_DEFAULT=255
source /home/pi/dom/bash/hue/func_color.sh
set_default_color
TEMPS_TRANSITION_DEFAULT=3
echo $HUE_IP_PONT $HUE_USER
if [[ $# -eq 0 ]]; then
	LAMPES=(1 2)
	INTENSITE=$INTENSITE_DEFAULT
	COULEUR=$COULEUR_DEFAULT
	TEMPS_TRANSITION=$TEMPS_TRANSITION_DEFAULT
elif [[ $# -eq 1 ]]; then
	LAMPES=$(echo $1 | tr "," "\n")
	INTENSITE=$INTENSITE_DEFAULT
	COULEUR=$COULEUR_DEFAULT
	TEMPS_TRANSITION=$TEMPS_TRANSITION_DEFAULT
elif [[ $# -eq 2 ]]; then
	LAMPES=$(echo $1 | tr "," "\n")
	INTENSITE=$2
	COULEUR=$COULEUR_DEFAULT
	TEMPS_TRANSITION=$TEMPS_TRANSITION_DEFAULT
elif [[ $# -eq 3 ]]; then
	LAMPES=$(echo $1 | tr "," "\n")
	INTENSITE=$2
	COULEUR=$3
	TEMPS_TRANSITION=$TEMPS_TRANSITION_DEFAULT
elif [[ $# -eq 4 ]]; then
	LAMPES=$(echo $1 | tr "," "\n")
	INTENSITE=$2
	COULEUR=$3
	TEMPS_TRANSITION=$4
fi

if [ ${COULEUR:0:1} = "#" ]; then
	from_rgb_to_cie $COULEUR
else
	from_kelvin_to_cie $COULEUR
fi
echo $COULEUR_XY

echo $INTENSITE
test $INTENSITE -gt 0 
if [[ $? -eq 0 ]]; then
	ON=true
else
	ON=false
fi

$ON && DATA="{ \
\"on\":true, \
\"bri\":$INTENSITE, \
\"xy\":$COULEUR_XY, \
\"transitiontime\":$TEMPS_TRANSITION \
}"
! $ON && DATA="{ \
\"on\":false \
}"
echo $DATA

for ID_LIGHT_CURRENT in ${LAMPES[*]}; do
	URL="http://${HUE_IP_PONT}/api/${HUE_USER}/lights/$ID_LIGHT_CURRENT/state"
	echo $URL
	curl -H "Accept: application/json" -X PUT --data "${DATA}" ${URL}
done
