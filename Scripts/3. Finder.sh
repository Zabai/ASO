#!/bin/bash

function finder(){
	index=0
	find / -exec stat -c "%U" {} \;
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
	
	echo "Lista de usuarios con mas de $nFiles ficheros"
	finder | printer $nFiles
else
	echo Nº incorrecto de argumentos
fi
