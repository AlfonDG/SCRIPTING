#!/bin/bash

echo "Bienvenido al Script que calculará tu peso ideal en base a los datos que nos hayas adjuntado."

echo

if [[ $# -ne 2 ]]; then

	echo "No has pasado al menos dos argumentos. Solamente has pasado $# vuelve a intentarlo"

	exit 1

fi

sleep 1

echo "Calculando tu peso..."

sleep 1

echo

peso=$1

altura=$2

pesIdeal=$(($altura - 110))

if [[ $peso -gt $pesIdeal ]]; then

	cowsay -f tux "Has de comer más verdura."

elif [[ $peso -lt $pesIdeal ]]; then

	cowsay -f tux "Has de comer más grasas."
else

	cowsay -f tux "Estás en tu peso ideal"

fi
