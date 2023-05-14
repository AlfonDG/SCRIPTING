#!/bin/bash

if [[ ! -f $2 ]]; then

	echo "El fichero que has pasado como parámetro no es válido o no es un fichero"

	echo

	echo "Saliendo del programa..."

	sleep 1

	exit 1

else

	case $1 in

	mostrar_3ultimos)

			echo "Mostraremos las tres últimas líneas del fichero"

			tail -n 3 $2

			exit 0

        	;;

	mostrar_3primeros)

			echo "Mostraremos las tres primeras líneas del fichero"

			head -n 3 $2

			exit 0

        	;;
	mostrar_todo)

		echo "Mostramos a continaución todas las líneas del fichero"

		cat $2

		exit 0

        	;;

	backup)

		if [[ ! -e backup.txt ]]; then

			echo "El fichero no existe por lo que crearé la copian de seguridad."

			cp $2 backup.txt

			exit 0

		elif [[ -e backup.txt ]]; then

			echo "Ya existe el backup con ese nombre. No se realizará ninguna opción más"

			exit 2

		fi

        	;;
	*)

		echo "No sé que hacer"

		exit 0

		;;
	esac

fi
