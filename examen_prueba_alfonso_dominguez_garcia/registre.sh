#!/bin/bash

while true; do

	echo "============================================================="

	echo

	echo "Bienvenido $USER al registro de usuarios en formato .CSV"

	echo

	echo "============================================================"

	echo

	echo -n "Introduzca el nombre de la persona: "

	read nombre

	echo

	echo -n "Introduzca el primer apellido: "

	read apellido

	echo

	echo -n "Introduzca el segundo apellido: "

	read segundoApellido

	echo

	echo

	echo -n "Introduzca la edad de la persona: "

	read edad

	echo

	echo -n "Introduzca el sexo de la persona: "

	read sexo

	echo

	echo -n "Introduzca el número de teléfono de la persona: "

	read telefono

	echo

	echo -n "Introduzca el correo electrónico de la persona: "

	read correo

	echo

	echo "Creando el fichero temporal, un momento por favor..."

	sleep 1

	touch ficheroTemp.txt

	echo "$nombre,$apellido,$segundoApellido,$edad,$sexo,$telefono,$correo" >> ficheroTemp.txt

	echo

	echo "Creando el fichero registro de datos .CSV"

	sleep 2

	cat ficheroTemp.txt >> datosRegistro.csv

	rm ficheroTemp.txt

	echo

	echo -n "Deseas introducir más usuarios? [y/n]: "

	read siNoUser

	if [[ $siNoUser == "y" ]]; then

		continue


	elif [[ $siNoUser == "n" ]]; then


		break

	fi

done
