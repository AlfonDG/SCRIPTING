#!/bin/bash

if [[ $# -eq 1 ]]; then

    var="/home/$USER/$1"

    if [[ -e $var ]]; then

        export fichero="$1"

        /home/$USER/scripts/filetype.sh $fichero

    else

        echo "El fichero $1 no existe en este Home Directory"

	echo

	echo "Saliendo del programa..."

	exit 1

    fi

else

    echo "Por favor ha de introducir al menos un parámetro."

    echo

    echo "Saliendo del programa $USER..."

   exit 2

fi
