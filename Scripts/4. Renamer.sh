#!/bin/bash

function rename(){
	find "$1" -name "*.cpp" -type f | while read file
	do
		local dir=$(dirname "$file")
		local name=$(basename "$file")
		name=${name/.cpp/.cc}
		mv "$file" "$dir/$name"
	done
}

if(( $# == 1 ))
then
	path=$1
	rename "$path"
else
	path="."
	rename "$path"
fi
