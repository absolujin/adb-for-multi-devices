#!/bin/bash

# writtend by yjpark(absolujin@gmail.com)
# date: 2017.01.11

DEVICES="$(adb devices -l | grep device | grep -v List)"
COUNT=`echo "$DEVICES" | wc -l`

if [ $COUNT -gt 1 ]
then
	SERIAL_ARRAY=($(echo "$DEVICES" | awk '{print $1}'))
	PRODUCT_ARRAY=($(echo "$DEVICES" | awk '{print $4}'))
	MODEL_ARRAY=($(echo "$DEVICES" | awk '{print $5}'))

	for ((NO=0; NO<${#SERIAL_ARRAY[@]}; NO++))
	do
		echo -e "\t$NO) ${SERIAL_ARRAY[$NO]} ${PRODUCT_ARRAY[$NO]} ${MODEL_ARRAY[$NO]}"
	done

	echo -e "\t *) ALL; Be Careful!; Only Can Do Some Commands!!"

	echo -en "\n\tdevice number: "
	read SELECTNO

	SELECTED=${SERIAL_ARRAY[$SELECTNO]}

else
	SELECTED=`echo "$DEVICES"| awk '{printf $1}'`
fi

adb -s $SELECTED $@
