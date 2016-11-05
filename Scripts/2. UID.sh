#!/bin/bash

function uidRanged(){
	IFS=$":"
	
	while read name x uid x
	do
		if(( $uid >= $1 )) && (( $uid <= $2 ))
		then
			echo "$uid - $name"
		fi
	done
}

function getMin(){
	min=$(grep -E "UID_MIN*" "/etc/login.defs" | sed 's/[^0-9]//g')
	return $min
}

function getMax(){
	max=$(grep -E "UID_MAX*" "/etc/login.defs" | sed 's/[^0-9]//g')
	return $max
}

if(( $# == 2 ))
then
	min=$1
	max=$2
	
	uidRanged $min $max < /etc/passwd
	exit 0
else
	getMin
	getMax

	uidRanged $min $max < /etc/passwd
	exit 0
fi
