#!/bin/bash

echo "Hola $USEr bienvenido/ida al fichero mejormenor.sh aquí jugaremos a un juego en el que tendrás un total de 3 segundos para escojer solamente"

echo

echo "Tendrás que adivinar un número al azar entre 0 y 99"


while true; do

	numeroAleatorio=$(($RANDOM%100))

	echo $numeroAleatorio

	numeroIntentos=0


	echo -n "Escoga el número que deseé e intente adivinarlo: "

	read -t 3 numeroAdivinar

	numeroIntentos=$(($numeroIntentos + 1))

	echo $numeroIntentos


	if [[ $numeroAdivinar -eq $numeroAleatorio ]]; then

		echo "Enhorabuena has adivinado el número que era $numeroAleatorio. Felicidades"

		echo

		echo "Has usado un total de $numeroIntentos"

		break

	elif [[ $? -ne 0 ]]; then

		echo "Se ha acabado el tiempo para elegir un número"

		echo

		echo "Has realizado un total de $numeroIntentos"

		break

	else

		continue

	fi

done
