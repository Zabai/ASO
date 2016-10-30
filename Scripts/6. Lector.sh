#!/bin/bash

function reader(){
	while(( $index <= $max ))
	do
		for file in $*
		do
			if [ -n "$(sed -n "$index"p "$file")" ]
			then
				echo $(sed -n "$index"p "$file")
			fi
		done
		echo
		index=$(( $index+1 ))
	done
}

function getMax(){
	max=$(wc -l "$1" | cut -d" " -f1)
	for file in $*
	do
		local wc=$(wc -l "$file" | cut -d" " -f1)
		if(( $wc > $max ))
		then
			max=$wc
		fi
	done
}

if(( $# >= 2 ))
then
	index=1
	getMax $*
	reader $*
	exit 0
else
	echo Nº insuficientes de argumentos
	exit 1
fi
