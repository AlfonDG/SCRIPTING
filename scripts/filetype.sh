#!/bin/bash

fichero=$1

if [[ $# -eq 0 ]]; then

    echo "Por favor inserte al menos un parámetro que sea un fichero."

    echo

    echo "Saliendo del programa."

    exit 1

fi


if [[ -f $fichero ]]; then

     echo "El fichero $fichero es un fichero normal."

     echo

     echo "Le devolvemos a su prompt $USER"

    sleep 1

elif [[ -d $fichero ]]; then

    echo "El fichero $fichero es un directorio."

    echo

    echo "Le devolvemos a su prompt $USER"

    sleep 1

elif [[ -b $fichero ]]; then

    echo "El fichero $fichero es un bloque"

    echo

    echo "Le devolvemos a su prompt $USER"

    sleep 1

elif [[ -c $fichero ]]; then

    echo "El fichero $fichero es un CARÁCTER"

    echo

    echo "Le devolvemos a su prompt $USER"

    sleep 1


elif [[ -S $fichero ]]; then

    echo "El fichero $fichero es un SOCKET"

    echo

    echo "Le devolvemos a su prompt $USER"

    sleep 1

elif [[ -p $fichero ]]; then

    echo "El fichero $fichero es una PIPE."

    echo

    echo "Le devolvemos a su prompt $USER"

    sleep 1


elif [[ -L $fichero ]]; then

    echo "El fichero $fichero es un enlace simbólico."

    echo

    echo "Le devolvemos a su prompt $USER"

    sleep 1


else

    echo "El tipo de fichero $fichero no pudo ser determinado, de esta forma cerramos el programa."

    exit 2

fi
