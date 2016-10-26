#!/bin/bash

# Hace BackUp de los ficheros pasado por argumento
echo Nº argumentos $#

while(( $# > 0 ))
do
	if [[ -f "$1" ]]
	then
		echo BackUp del fichero "$1"
		cp "$1" "$1".$(date +%Y-%m-%d)
	else
		echo El fichero $1 no existe >&2		
	fi
	shift 1
done

exit 0
