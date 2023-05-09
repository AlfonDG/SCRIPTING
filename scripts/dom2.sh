#!/bin/bash

echo "Hola $USER estás a punto de usar el nuevo y mejorado script dom2.sh"

echo

echo -n "Introduzca el mes que desea comprobar: "

read -t 20 mesUser

year=$(cal 2023)

mes=$mesUser

case $mes in

"enero" | "marzo" | "mayo" | "julio" | "agosto" | "octubre" |  "diciembre")


	echo "El mes actual $mes que has introducido tiene un total de 31 días"

	echo

	echo "Te devolvemos a tu prompt $USER"

	sleep 1

	;;

"abril" | "junio" | "septiembre" | "noviembre")

	echo "El mes actual $mes que has introducido tiene un total de 30 días"

	echo

	echo "Te devolvemos a tu prompt $USER"

	sleep 1

	;;


"febrero")

	if [ $((year % 4)) -eq 0 -a $((year % 100)) -ne 0 ] || [ $((year % 400)) -eq 0 ]; then

		echo "El mes actual $mes tiene un total de 29 días, es bisiesto"
	else

		echo "El mes actual $mes tiene un total de 28 días"

	fi

	;;

*)
	echo "El mes $mes introducido no existe o no es correcto"

	echo

	echo "Saliendo del programa..."

	exit 2

	;;

esac
