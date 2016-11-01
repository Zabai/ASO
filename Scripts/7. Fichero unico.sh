#!/bin/bash

function diffFiles(){
	local diffFolder="$2"
	for folder in $*
	do
		ls "$folder" | while read fileName
		do
			if [ -z $(find "$diffFolder" -maxdepth 1 -name "$fileName") ]
			then
				echo "$folder"/"$fileName"
			fi
		done
		diffFolder="$1"
	done
}

if(( $# == 2 ))
then
	path1=$1
	path2=$2
	
	# Para que los argumentos del for no se separen por los espacios
	IFS=$(echo -en "\n\b")
	
	diffFiles "$path1" "$path2"

	exit 0
else
	echo Nº de argumentos incorrectos
	exit 1
fi
