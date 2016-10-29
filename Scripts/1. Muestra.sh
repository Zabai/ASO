#!/bin/bash

function verImpar(){
	cat $1 | while read line
	do
		if(( $lineN % 2 != 0 ))
		then
			echo "$line"
		fi
		
		lineN=$(( $lineN + 1 ))
	done

}

function verPar(){
	cat $1 | while read line
	do
		if(( $lineN % 2 == 0 ))
		then
			echo "$line"
		fi
		
		lineN=$(( $lineN + 1 ))
	done
}

param=$1
file=$2

lineN=1

if [ $param = "-i" ]
then
	shift
	for file in $*
	do
		printf "\nLíneas impares del fichero '$file':\n"
		verImpar $file
	done
	exit 0
elif [ $param = "-p" ]
then
	shift
	for file in $*
	do
		printf "\nLíneas pares del fichero '$file':\n"
		verPar $file
	done
	exit 0
else
	for file in $*
	do
		printf "\nLíneas impares del fichero '$file':\n"
		verImpar $file
	done
	exit 0
fi
