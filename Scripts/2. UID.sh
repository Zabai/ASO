#!/bin/bash

function uidRanged(){
	while read name x uid x
	do
		if(( $uid >= $1 )) && (( $uid <= $2 ))
		then
			echo "$uid - $name"
		fi
	done
}

function getMin(){
	min=$(grep -E "UID_MIN*" "/etc/login.defs")
	min=$(echo $min | sed 's/[^0-9]//g')
	return $min
}

function getMax(){
	max=$(grep -E "UID_MAX*" "/etc/login.defs")
	max=$(echo $max | sed 's/[^0-9]//g')
	return $max
}

if(( $# == 2 ))
then
	min=$1
	max=$2
	
	echo "UID - Usuario"
	
	IFS=$":"
	cat "/etc/passwd" | uidRanged $min $max
	
	exit 0
else
	getMin
	getMax

	IFS=$":"
	cat "/etc/passwd" | uidRanged $min $max
	exit 0
fi
