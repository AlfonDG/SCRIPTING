#!/bin/bash

hora=$1

minuts=$2

if [[ $# -eq 0 ]] || [[ $# -eq 1 ]]; then

	echo "No has pasado ningún argumento $USER o solamente has pasado uno. En este caso has pasado $# argumentos, vuelva a intentarlo"

	echo

	echo "Saliendo del programa..."

	exit 1

fi


minutosAlarma=$((hora * 100 + minuts))

until [[ $(date +%H%M) -eq $minutosAlarma ]]; do

	sleep 1

done

echo "Ya es la hora ALARMA!"

sleep 2

echo "Es la hora $hora:$minuts"
