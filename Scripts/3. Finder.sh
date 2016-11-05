#!/bin/bash

function finder(){
	index=0
	find / -printf "%u\n" | sort
}

function printer(){
	uniq -c | while read count user
	do
		if(( $count >= $1 ))
		then
			echo "$user"
		fi
	done
}

if(( $# == 1 ))
then
	nFiles=$1
	
	echo "Lista de usuarios con más de $nFiles ficheros"
	finder 2>/dev/null | printer $nFiles
	exit 0
else
	echo Nº incorrecto de argumentos
	exit 1
fi
