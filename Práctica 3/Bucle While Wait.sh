#!/bin/bash

i=1;

pstree;
sleep 4;

while [[ $i -le 10 ]]
do
	echo $i Hola Mundo;
	let i=i+1;
done
