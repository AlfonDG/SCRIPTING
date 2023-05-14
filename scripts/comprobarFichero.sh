#!/bin/bash

if [[ -f $1 ]] && [[ -r $1 ]]; then

	echo "Es un fichero regular y también es un fichero normal, a continuación te indicaré las 3 últimas líneas del fichero"

	sleep 1

	tail -n 2 $1

elif [[ -d $1 ]]; then

	echo "Es un directorio y a continuación contaré el número de directorios en la ruta en la que estés situado"

	sleep 1

	ls -l $(pwd) | wc -l

else
	sleep 1

	echo "No es ni un fichero ni un directorio"

fi

