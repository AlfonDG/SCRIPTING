#!/bin/bash

rutaIntroducida="$1"

if [[ $# -eq 0 ]]; then

	echo "No has pasado ningun un directorio como parámetro"

	echo

	echo "Saliendo del programa..."

	exit 1


elif [[ ! -d "$1" ]]; then

	echo "No es un directorio, lo sentimos pero no lo hemos podido encontrar en $1"

	echo

	echo "Saliendo del programa..."

	exit 2

else
	echo "Has introducido el directorio $1"

        echo

        echo "Te mostramos a continuación los ficheros ocultos"

        ficherosOcultos=$(sudo find "$1" -name ".*"| wc -l)

        echo

	todosFicherosOcultos=$(sudo find "$1" -name ".*")

        echo "Hay un total de $ficherosOcultos ficheros en oculto en el directorio $1"

	echo

	echo -n "Desea descoultar los ficheros? [y/n]: "

	read desocultarFicheros

	if [[ $desocultarFicheros == "y" ]]; then

		for i in ${todosFicherosOcultos}; do

			desocultarFicheros=$(echo $i | sed 's/^\.\///')

			sudo mv "$i" "$desocultarFicheros"
        	done

	elif [[ $desocultarFicheros == "n" ]]; then


		echo "No desea desocultar los ficheros"

		echo

		echo "Saldremos del script ocults.sh"

		exit 2

	else

		echo "No has seleccionado una opción válida"

		echo

		echo "Saliendo del programa..."

		exit 3

	fi

fi
