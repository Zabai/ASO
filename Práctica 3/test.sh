#!/bin/bash

function finder() {
	if [[ -f $1 ]]
	then
		echo El fichero $1 se encuentra en $path/$1
	else
		echo $1 no es un fichero >&2
	fi
}

function trueFinder() {
	if [[ -f $1 ]]
	then
		path=$(find $1)
		echo El fichero $1 se encuentra en $path
	else
		echo $1 no es un fichero >&2
	fi
}

path=$(pwd)

while(( $# > 0 ))
do
	#finder "$1"
	trueFinder $1
	shift 1
done
