#!/bin/bash

function check(){
	cat "/etc/passwd" | cut -d":" -f7 | while read shell
	do
		if [ -z $(grep "$shell" "/etc/shells") ]
		then
			echo $shell
		fi
	done
}

if(( $# == 0 ))
then
	check
	exit 0
else
	echo "Nº de argumentos incorrecto"
	exit 1
fi
