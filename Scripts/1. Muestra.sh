#!/bin/bash

function verImpar(){
	local lineN=1
	while read line
	do
		if(( $lineN % 2 != 0 ))
		then
			echo "$line"
		fi
		
		lineN=$(( $lineN + 1 ))
	done < $1

}

function verPar(){
	local lineN=1
	while read line
	do
		if(( $lineN % 2 == 0 ))
		then
			echo "$line"
		fi
		
		lineN=$(( $lineN + 1 ))
	done < $1
}

param=$1
file=$2

if [ $param = "-i" ]
then
	shift
	for file in $*
	do
		verImpar $file
	done
	exit 0
elif [ $param = "-p" ]
then
	shift
	for file in $*
	do
		verPar $file
	done
	exit 0
else
	for file in $*
	do
		verImpar $file
	done
	exit 0
fi
