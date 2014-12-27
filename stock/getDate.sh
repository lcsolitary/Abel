#!/bin/bash

DATATYPE="GSPC IXIC DJI"

COUNT=0
for i in $DATATYPE
do
	COUN=$(( $COUNT+66 ))	
	curl -d  "s=%5E$i&a=01&b=01&c=2010&d=11&e=15&f=2014&g=d&" http://finance.yahoo.com/q/hp >> tmp.html
done


cat tmp.html | grep -E  "</th></tr><tr>" | \
	awk 'BEGIN{RS="<td class=\"yfnc_tabledata1\" nowrap align=\"right\">";} NF' | \
	awk -F'</td><td class="yfnc_tabledata1" align="right">'  '{print $1,$2,$3,$4,$5,$6}' 
