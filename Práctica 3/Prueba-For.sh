#!/bin/bash

for file in $(find . -type f -name "*.sh")
do
	echo "He encontrado un script: '$file'"
done

printf "\nTodos los argumentos: $*\n"

cat <<HELP
Ayuda:

	--help da un mensaje
	-o fichero borra el fichero
	-p asgsagh
	-q asdfnakrgh
HELP
