#!/bin/bash

function reader(){
	while(( $index <= $min ))
	do
		for file in $*
		do
			echo $(sed -n "$index"p "$file")
		done
		echo
		index=$(( $index+1 ))
	done
}

function getMin(){
	min=$(wc -l "$1" | cut -d" " -f1)
	for file in $*
	do
		local wc=$(wc -l "$file" | cut -d" " -f1)
		if(( $wc < $min ))
		then
			min=$wc
		fi
	done
}

if(( $# >= 2 ))
then
	index=1
	getMin $*
	reader $*
	exit 0
else
	echo Nº insuficientes de argumentos
	exit 1
fi
