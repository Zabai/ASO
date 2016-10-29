#!/bin/bash

#UMBRAL=500
[[ $1 = "" ]] && UMBRAL=500 || UMBRAL=$1

bucle(){
	num=0
	while read longitud fecha_acceso nombre
	do
		if(( $longitud >= $UMBRAL ))
		then
			echo Fichero \"$nombre\" con longitud $longitud bytes
			(( num++ ))
		fi
	done
	echo "He encontrado $num ficheros con más de $UMBRAL bytes"
}

stat -c "%s %Y %n" | bucle
	
