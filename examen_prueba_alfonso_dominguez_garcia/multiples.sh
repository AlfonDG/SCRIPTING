#!/bin/bash

listadoNumeros=$@

if [[ $# -eq 0 ]]; then

	echo "Ha de establecer al menos un parámetro para los números pares y no ha pasado ninguno"

	echo

	echo "Saliendo del programa..."

	exit 1

else
	echo "Los parámeros pasados anteriormente son [$@]"

	echo

	echo -n "Introduzca el número con el que desea valorar los números anteriores: "

	read numeroEvaluar


	for i in ${listadoNumeros}; do


		if [[ $(($i % $numeroEvaluar)) -eq 0 ]]; then

			echo "El número $i es multiplo de $numeroEvaluar"

		else

			echo "El número $i No es multiplo de $numeroEvaluar"

		fi

	done


fi
