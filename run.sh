#!/bin/bash

if [[ -z "$URL" ]] ; then
    echo "URL is not set"
    exit 1
fi

if [[ -z "$LEVEL" ]] ; then
    LEVEL="MEDIUM"
fi

if [[ ! $LEVEL =~ ^(LOW|MEDIUM|HIGH|CRITICAL)$ ]] ; then
    echo "LEVEL is not one of LOW|MEDIUM|HIGH|CRITICAL"
    exit 1
fi

./testssl.sh --csvfile out.csv --severity $LEVEL --protocols --server-defaults $URL

# The first line is the CSV header
NUMBER_OF_LINES=$(cat out.csv | grep -v '"WARN"' | wc -l)
cat out.csv

# If number of lines is greater than 0, exit with error
if [[ $NUMBER_OF_LINES -gt 1 ]] ; then
    echo "Number of findings is greater than 0, exiting with exit code 1"
    exit 1
fi

echo "Number of findings is 0, exiting with exit code 0"
