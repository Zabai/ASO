#!/bin/bash

while (( $# > 0 ))
do
	echo $1
	# Shift elimina los n argumentos y desplaza los demás a la izq
	# Por lo que el primero despues del shift es el segundo param original
	shift 1
done
