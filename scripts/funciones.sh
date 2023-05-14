#!/bin/bash

moverFichero() {

	sudo mv $1 $2
}

copiarFichero() {

	sudo cp $1 $2
}

mostrarFicheros() {

	find $1 -type f | wc -l

}

rutaDestinoUser=""

opciones=("EstablecerRutaDestino" "MoverRutaFichero" "CopiarFicheroRuta" "ListarFicheros" "Salir")

PS3="Selecciona una de las siguientes opciones: "


select opcion in ${opciones[@]}; do

	case $opcion in


	"EstablecerRutaDestino")

		echo -n "Establezca aquí $USER la ruta absoluta de un directorio: "

		read rutaAbsolutaUser

		rutaDestinoUser=$rutaAbsolutaUser


		if [[ ! -d $rutaDestinoUser ]]; then

                        echo "Lo sentimos pero no ha establecido una ruta de directorio correcta"

                        echo

                        echo "Saliendo del programa..."

                        exit 3

		else

			echo "Perfecto, ruta encontrada y almacenada $USER"

		fi



		;;

	"MoverRutaFichero")


		if [[ -z $rutaDestinoUser ]]; then

                	echo "Por favor, establezca la ruta de destino primero."

			echo

			echo "Saliendo del programa..."


			exit 3

		else

			echo -n "Introduzca el fichero que deseas mover: "

                	read ficheroMoverUser

			moverFichero $ficheroMoverUser $rutaDestinoUser


		fi

		;;

	"CopiarFicheroRuta")

		if [[ -z $rutaDestinoUser ]]; then

			echo "Por favor, establezca la ruta de destino primero"

			echo

			echo "Saliendo del programa..."

			exit 3

		else

			echo -n "Introduzca el fichero que desea copiar"

			read ficheroCopiarUser

			copiarFichero $ficheroCopiarUser $rutaDestinoUser
		fi

		;;

	"ListarFicheros")

		if [[ -z $rutaDestinoUser ]]; then

                        echo "Por favor, establezca la ruta de destino primero"

			echo

			echo "Saliendo del programa..."

			exit 3

                else

                        echo "Ok, mostraremos a continuación los ficheros del directorio y a continuación contaremos los ficheros que hay en el directorio introducido"

			echo

			numeroFicherosTotales=$(mostrarFicheros $rutaDestinoUser)

			echo "Hay  un total de $numeroFicherosTotales en el directorio $rutaDestinoUser"

                fi


		;;

	"Salir")

		echo "Vale $USER, saldremos del programa..."

		echo

		echo "Le devolvemos a su prompt"

		exit 1

		;;

	*)

		echo "No has escrito una opción adecuada. Saliendo del programa..."

		echo

		exit 2

		;;

	esac

done
