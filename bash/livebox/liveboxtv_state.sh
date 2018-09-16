#!/bin/bash
TV_STATE_ACTIVE=`curl -H "Accept: application/json" http://192.168.1.10:8080/remoteControl/cmd?operation=10 | jq .result.data.activeStandbyState`
echo $TV_STATE_ACTIVE
if [ "$TV_STATE_ACTIVE" = "\"1\"" ]; then
	echo "Eteinte" > /tmp/dom.fromscript.liveboxtv_message.val	
	echo "Eteinte"
elif [ "$TV_STATE_ACTIVE" = \"0\" ]; then
	TV_OSD_CONTEXT=`curl -H "Accept: application/json" http://192.168.1.10:8080/remoteControl/cmd?operation=10 | jq .result.data.osdContext`
	if [ "$TV_OSD_CONTEXT" = \"LIVE\" ]; then
		TV_CHAINE_ID=`curl -H "Accept: application/json" http://192.168.1.10:8080/remoteControl/cmd?operation=10 | jq .result.data.playedMediaId`
		echo $TV_CHAINE_ID
		chaines[4294967295]="0;Mosaic"
		chaines[192]="1;TF1"
		chaines[195]="10;TMC"
		chaines[446]="11;NT1"
		chaines[659]="111;Vivolta"
		chaines[444]="12;NRJ 12"
		chaines[-1]="120;DogTv"
		chaines[234]="13;LCP"
		chaines[829]="135;MyZenTV"
		chaines[787]="138;NoLife"
		chaines[78]="14;France 4"
		chaines[563]="140;GINX"
		chaines[6]="145;Mangas"
		chaines[481]="15;BFMTV"
		chaines[325]="150;Trace Urban"
		chaines[605]="151;NRJ Hits TV"
		chaines[-1]="152;Virgin Radio Tv"
		chaines[1622]="153;Indies Live"
		chaines[-1]="154;OFive"
		chaines[-1]="155;BBlackClasik"
		chaines[-1]="156;BBlackCaribbean"
		chaines[226]="16;CNEWS"
		chaines[241]="161;RFMTV"
		chaines[753]="162;TraceTropical"
		chaines[265]="164;Melody"
		chaines[-1]="166;myMTV"
		chaines[458]="17;CStar"
		chaines[1353]="170;Classica"
		chaines[64]="173;EquidiaLIFE"
		chaines[1290]="176;BeingSport1"
		chaines[-1]="177;OUATCH"
		chaines[226]="18;Gulli"
		chaines[237]="187;MotorSportTV"
		chaines[160]="19;France O"
		chaines[463]="198;OLTV"
		chaines[4]="2;France 2"
		chaines[1404]="20;HD1"
		chaines[1401]="21;L'Equipe21"
		chaines[1061]="211;LuckyJack"
		chaines[1996]="214;FashionTv"
		chaines[531]="215;LuxeTv"
		chaines[987]="217;Ma chaine Etudiante"
		chaines[57]="219;Demain!"
		chaines[1403]="22;6ter"
		chaines[992]="225;LCP100%"
		chaines[-1]="226;PublicSénat"
		chaines[529]="227;France 24"
		chaines[1073]="228;BFMBusines"
		chaines[1402]="23;Numéro 23"
		chaines[671]="232;France 24 English"
		chaines[53]="234;CNN"
		chaines[51]="235;CNBC"
		chaines[410]="236;Bloomberg"
		chaines[1400]="24;RMC Découverte"
		chaines[1399]="25;Chérie 25"
		chaines[112]="26;LCI"
		chaines[2111]="27;France Info"
		chaines[80]="3;France 3"
		chaines[191]="34;Teva"
		chaines[34]="4;Canal+"
		chaines[47]="5;France 5"
		chaines[449]="585;Télé Sud"
		chaines[118]="6;M6"
		chaines[111]="7;Arte"
		chaines[445]="8;C8"
		chaines[58]="86;Disney Channel"
		chaines[119]="9;W9"

		FIND=false
		for idChaine in ${!chaines[@]}; do
			if [ \"$idChaine\" = $TV_CHAINE_ID ]; then
				FIND=true
				NAME_CHAINE=`echo ${chaines[$idChaine]} | cut -d';' -f2` 
				echo $NAME_CHAINE
				echo $NAME_CHAINE > /tmp/dom.fromscript.liveboxtv_message.val
			fi
		done
		! $FIND && echo notFind && echo $TV_CHAINE_ID > /tmp/dom.fromscript.liveboxtv_message.val
	else
		echo $TV_OSD_CONTEXT > /tmp/dom.fromscript.liveboxtv_message.val	
		echo $TV_OSD_CONTEXT
	fi
fi
