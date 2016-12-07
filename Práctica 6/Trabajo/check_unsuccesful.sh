#!/bin/bash

# Trabajo práctica 6 actividad 4

function getDate(){
	if [ -e /var/log/login_unsuccessful ]
	then
		date=$(date -r /var/log/login_unsuccessful +%s)
	else
		date=0
	fi
}

function checkLoginFails(){
	grep "authentication failure" | cut -d " " -f1-20 | while read month day x
	do
		actual=$(date -d $month$day +%s)
		if(( $actual > $date ))
		then
			echo 
		fi
	done
}

if(( $# == 1 ))
then
	getDate
	checkLoginFails < /var/log/secure
	exit 0
fi

echo "Nº incorrecto de argumentos"
exit 1
