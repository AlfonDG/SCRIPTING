#!/bin/bash

parametroUser=$1

if [[ $# -eq 0 ]]; then

	echo "No has pasado ningún parámetro, deberías pasar un número"

	echo

	echo "Saliendo del programa..."

	exit 1

fi

cuentaAtras=$parametroUser

while [ $cuentaAtras -gt 1 ]; do

	cuentaAtras=$(( $cuentaAtras - 1 ))

	sleep 1

	echo $cuentaAtras

done
