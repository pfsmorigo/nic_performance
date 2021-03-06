#!/bin/bash

FILE=$1

if [ -z "$FILE" ];
then
	echo "FILE not specified"
	exit 4
fi

mv $FILE $FILE.old 2> /dev/null 
RESULT=$(sar -u 1 3 | tail -1 | awk '{print $8}');
echo "scale=2; 100 - $RESULT " | bc > $FILE
