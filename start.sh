#!/bin/sh
PERIOD=hourly

TEMP=`getopt -o s:a::p:: --long script:,args::,period:: -- "$@"`
eval set -- "$TEMP"

while true; do
  case "$1" in
    -s | --script ) SCRIPT="$2"; shift 2 ;;
    -a | --args ) ARGS="$2"; shift 2 ;;
    -p | --period ) PERIOD="$2"; shift 2 ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

echo script=$SCRIPT
echo args=$ARGS
echo period=$PERIOD

curl -o /script.sh $SCRIPT
touch /etc/periodic/$PERIOD/init.sh
echo ./script.sh $ARGS > /etc/periodic/$PERIOD/init.sh
chmod a+x /etc/periodic/$PERIOD/init.sh
crond -l 2 -f
