#!/bin/bash

if [[ $# -eq 0 ]]; then

	echo "Al no haber pasado ningún directorio como parámetro usaremos la ruta del /home/$(whoami) de su usuario $USER"

	ruta="/home/$(whoami)"


else

	ruta=$1

fi

listarContenido=$(ls $ruta)

for i in ${listarContenido}; do

	if [[ -f "$ruta/$i" ]]; then

		echo "$i" | tr "[:upper:]" "[:lower:]"

	elif [[ -d "$ruta/$i" ]]; then

		echo "$i" | tr "[:lower:]" "[:upper:]"
	fi


done
