#!/bin/bash

echo "==================================================================================================================="

echo

echo "Bienvenido al script BORRA.SH $USER aquí te mostraremos y ejecutaremos la eliminación de los ficheros que deseé"

echo

echo "==================================================================================================================="


if [[ $# -eq 0 ]]; then


	echo "Lo siento $USER debes de introducir al menos 1 fichero para poder almacenarlo..."

	echo

	echo "Saliendo del programa..."

	exit 1


elif [[ $# != "/*" ]]; then

	echo "Uno de los ficheros no contiene ruta absoluta. Miraremos si se encuentra en el directorio actual, de lo contrario no lo añadiremos"

	echo

	echo "Buscando el fichero..."

	sleep 1

	rutaActual=$(pwd)

	if [[ -f $rutaActual ]]; then

		echo "No hemos encontrado el fichero en la ruta $rutaActual no se añadirá"

		echo

	else

		echo "Hemos encontrado el fichero en la ruta. Procesando y añadiendo a la ruta"

		echo

	fi

	sleep 1
fi

ficheros=($@)

PS3="Selecciona una opción: "

echo "Ahora $USER selecciona si desea borrar definitivamente o mover un fichero a la papelera de reciclaje"

echo

opciones=("BorrarDefinitivamente" "MoverAPapelera" "SalirBorra.sh")

select opcion in ${opciones[@]};

	do

		case $opcion in

		"BorrarDefinitivamente")

			echo "CUIDADO! Estás a punto de borrar un fichero y no tiene vuelta atrás..."

			sleep 1

			echo

			echo -n "Desea continuar con el borrado [y/n]: "

			read siNoBorrarDefinitivo

			if [[ $siNoBorrarDefinitivo == "n" ]];then


				echo "Has seleccionado la opción de salida $USER. Saldremos del programa..."

				echo

				echo "Saliendo del programa..."

				sleep 1

				exit 2

			else
				echo "Gracias por elegir $USER la eliminación definitiva del fichero $ficheros"

				echo

				echo "Por favor indique a continuación el nombre del fichero que desea eliminar"

				echo

				echo "Le recuerdo $USER sus ficheros a continaución ->"


				for i in ${ficheros[@]}; do


					echo $i

				done

				echo

				echo -n "Escriba el nombre del fichero a continuación: "

				read valorEliminacionUser

				echo "Fichero encontrado correctamente!, borrando..."

				sleep 1

				sudo rm -r ${ficheros[valorEliminacionUser]}

			fi

		;;

		"MoverAPapelera")

				echo "En esta opción vamos a proceder a mover un fichero a la papelera de reciclaje"

				echo

				echo "Te recordamos los ficheros que tienes en la lista ->"

				for x in ${ficheros[@]}; do

					echo $x

				done

				echo

				echo -n "Introduzca ahora el nombre del fichero que deseé y que se encuentre dentro de la lista: "

				read valorMoverPapeleraUser

				echo "Fichero encontrado correctamente!, moviendo a la papelera..."

				sleep 1

				sudo mv ${ficheros[valorMoverPapeleraUser]} "/trash"
		;;


		"SalirBorra.sh")

			echo "Saliendo del programa $USER, gracias por utilizar el script borra.sh vuelva cuando quiera"

			echo

			exit 3
		;;


		esac

done
