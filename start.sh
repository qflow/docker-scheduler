#!/bin/bash

while getopts "script:args" opt; do
    case $opt in
        script)  SCRIPT="$OPTARG"
            ;;
        args)  ARGS="$OPTARG"
            ;;
    esac
done

curl $SCRIPT
