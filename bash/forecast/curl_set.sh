
#!/bin/bash

API="https://api.darksky.net/forecast"
USER_KEY="735f55491186a26de275e621cdf16c2e"
LATITUDE=43.484920
LONGITUDE=5.346070
URL="${API}/${USER_KEY}/${LATITUDE},${LONGITUDE}"
echo $URL
API_RESPONSE=`curl -H "Accept: application/json" ${URL}`
#echo $API_RESPONSE

TIME=`echo $API_RESPONSE | jq .currently.time`
echo $TIME > /tmp/dom.fromscript.forecast.time
SUM=`echo $API_RESPONSE | jq .currently.summary`
echo $SUM > /tmp/dom.fromscript.forecast.summary
PRECIP_INTEN=`echo $API_RESPONSE | jq .currently.precipIntensity`
echo $PRECIP_INTEN > /tmp/dom.fromscript.forecast.precipIntensity
PRECIP_PROB=`echo $API_RESPONSE | jq .currently.precipProbability`
echo $PRECIP_PROB * 100 > /tmp/dom.fromscript.forecast.precipProbability
TMP=`echo $API_RESPONSE | jq .currently.temperature`
TMPC="$(/home/pi/dom/bash/forecast/f_to_c $TMP)"
echo $TMPC > /tmp/dom.fromscript.forecast.temperature
TMP_APP=`echo $API_RESPONSE | jq .currently.apparentTemperature`
TMPC_APP="$(/home/pi/dom/bash/forecast/f_to_c $TMP_APP)"
echo $TMPC_APP > /tmp/dom.fromscript.forecast.apparentTemperature
HUMID=`echo $API_RESPONSE | jq .currently.humidity`
echo `jq -n $HUMID*100` > /tmp/dom.fromscript.forecast.humidity
PRESS=`echo $API_RESPONSE | jq .currently.pressure`
echo $PRESS > /tmp/dom.fromscript.forecast.pressure
WIND_SPEED=`echo $API_RESPONSE | jq .currently.windSpeed`
B_SPEED="$(/home/pi/dom/bash/forecast/ms_to_f $WIND_SPEED)"
echo $B_SPEED > /tmp/dom.fromscript.forecast.windSpeed
WIND_RAF=`echo $API_RESPONSE | jq .currently.windGust`
B_RAF="$(/home/pi/dom/bash/forecast/ms_to_f $WIND_RAF)"
echo $B_RAF > /tmp/dom.fromscript.forecast.windRafale
WIND_DIR=`echo $API_RESPONSE | jq .currently.windBearing`
echo $WIND_DIR > /tmp/dom.fromscript.forecast.windDir
CLOUD=`echo $API_RESPONSE | jq .currently.cloudCover`
echo `$API_RESPONSE | jq .`
echo "C : $CLOUD"
echo `jq -n $CLOUD*100` > /tmp/dom.fromscript.forecast.cloudCover
UV=`echo $API_RESPONSE | jq .currently.uvIndex`
echo $UV > /tmp/dom.fromscript.forecast.uvIndex
VISIB=`echo $API_RESPONSE | jq .currently.visibility`
echo $VISIB > /tmp/dom.fromscript.forecast.visibility
OZONE=`echo $API_RESPONSE | jq .currently.ozone`
echo $OZONE > /tmp/dom.fromscript.forecast.ozone

