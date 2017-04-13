#!/bin/bash

PERIOD=hourly

while getopts "script:args:period" opt; do
    case $opt in
        script)  SCRIPT="$OPTARG"
            ;;
        args)  ARGS="$OPTARG"
            ;;
        period)  PERIOD="$OPTARG"
            ;;
    esac
done

curl -o /etc/periodic/$PERIOD/script.sh $SCRIPT
chmod a+x /etc/periodic/$PERIOD/script.sh
crond -l 2 -f
