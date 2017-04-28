#!/bin/sh
while :
do
    echo "Checking for inactive hosts every $INTERVAL seconds..."
    rancher hosts -a | grep -w inactive | while read LINE
    do
        HOST=$(echo $LINE | cut -d ' ' -f 1)
        echo "Delete $LINE"
        rancher rm --type host $HOST
    done
    sleep $INTERVAL
done
