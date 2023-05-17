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

	echo

	echo "Buscando el fichero..."

	sleep 1

	rutaActual=$(pwd)

	if [[ -f $rutaActual ]]; then

		echo "No hemos encontrado el fichero en la ruta $rutaActual no se añadirá"

		echo

		exit 7

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

				echo -n "Desea borrar todos los ficheros o uno por uno [todos/uno]: "

				read eliminarTodosUno

				if [[ $eliminarTodosUno == "todos" ]]; then

					echo "Has seleccionado la opción de borrar todos los ficheros de la lista $USER"

					echo

					for x in ${ficheros[@]}; do

						#Aquí crearé la linea de guardar el fichero de eliminació a trashlog.log

                                        	echo "Guradando un log en el fichero trashlog.log antes de eliminar los ficheros $x"

                                        	echo "eliminació:$(date +%D:%H.%M:):$x:$USER" >> "/trash/trashlogs/trashlog.log"

                                        	sleep 1

                                        	echo

                                        	#Primero generaremos una entrada al fichero trashlog.log que permitirá guardar las entradas de eliminació

                                        	echo "Guradando un log en el fichero de restauracio.log antes de eliminar los ficheros $x..."

                                        	echo "$x" >> "/trash/trashlogs/restauracio.log"

						echo "Eliminando los ficheros $x"

						sleep 1

						sudo rm -r "$x"

					done

					echo

					echo "Operación completada correctamente"

				elif [[ $eliminarTodosUno == "uno" ]]; then

					echo "Has seleccionado la opción de borrar solamente un fichero"

					echo

					echo -n "Introduzca ahora el nombre del fichero que desea eliminar [No hace falta introducir la extensión, ya sea .txt o bien .mp3 por ejemplo]: "

					read ficheroAEliminar

					#Aquí guardamos al fichero restauracio.log la entrada del fichero previamente a ser eliminado

					echo "Guradando un log en el fichero de restauracio.log antes de eliminar el fichero $ficheroAEliminar..."

                                        echo "$ficheroAEliminar" >> "/trash/trashlogs/restauracio.log"

					sleep 1

					echo "Creando un fichero log en trashlog.log antes de eliminar el fichero seleccionado $ficheroAEliminar..."

					#Aquí añadiré al fichero trashlog.log la entrada del fichero previamente a ser eliminado

					echo "eliminació:$(date +%D:%H.%M:):$ficheroAEliminar:$USER" >> "/trash/trashlogs/trashlog.log"

					sleep 1

					echo

					echo "Eliminando el fichero $ficheroAEliminar..."

					sudo rm -r "${ficheros[ficheroAEliminar]}"

					echo

					echo "Operación completada correctamente"

				else

					echo "No has seleccionado una opción correcta [todos/uno] por lo tanto saldremos del programa..."

					echo

					exit 4

				fi


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

				echo -n "Desea mover todos los ficheros a la papelera de reciclaje o uno por uno [todos/uno]: "

                                read moverTodosUno

                                if [[ $moverTodosUno == "todos" ]]; then

                                        echo "Has seleccionado la opción de borrar todos los ficheros de la lista $USER"

                                        echo

                                        for j in ${ficheros[@]}; do

						echo "Guradando un log en el fichero de trashlog.log antes de eliminar los ficheros $j..."

                                                sleep 1

                                                #Generaremos la entrada al script de trashlog.log en modo reciclaje

                                                echo "reciclatge:$(date +%D:%H.%M:):$j:$USER" >> "/trash/trashlogs/trashlog.log"

                                                sleep 1

                                                #Generando entrada al log restauracio.log en modo reciclaje

                                                echo "$j" >> "/trash/trashlogs/restauracio.log"

                                                echo "Moviendo los ficheros $j"

                                                sleep 1

                                                sudo mv "$j" "/trash/paperera"

                                        done

					echo "Se han movido todos los ficheros de la lista a la papelera de reciclaje de forma correcta $USER"

                                elif [[ $moverTodosUno == "uno" ]]; then

                                        echo "Has seleccionado la opción de mover a la papelera solamente un fichero"

                                        echo

                                        echo -n "Introduzca ahora el nombre del fichero que deseas mover a la papelera de reciclaje [No hace falta introducir la extensión ya se a.txt o .mp3 por ejemplo]: "

                                        read ficheroAMover

					echo "Generando un log en el fichero trashlog.log de reciclaje"

                                        sleep 1

                                        #Aquí añadiré al fichero trashlog.log la entrada del fichero previamente a ser movido a la papelera de reciclaje

                                        echo "reciclatge:$(date +%D:%H.%M:):$ficheroAMover:$USER" >> "/trash/trashlogs/trashlog.log"

					echo

					sleep 1

					echo "Generando un log en el fichero restauracio.log en caso de recuperación"

					#Aquí guradré la entrada al log de restauracio.log del fichero

					echo "$ficheroAMover" >> "/trash/trashlogs/restauracio.log"

                                        sudo mv "${ficheros[ficheroAMover]}" "/trash/paperera"

					echo "Se ha movido a la papelera de reciclaje de forma correcta $USER"

                                else

                                        echo "No has seleccionado una opción correcta [todos/uno] por lo tanto saldremos del programa..."

                                        echo

                                        exit 5

                                fi

		;;


		"SalirBorra.sh")

			echo "Saliendo del programa $USER, gracias por utilizar el script borra.sh vuelva cuando quiera"

			echo

			exit 3
		;;

		*)

			echo "No has seleccionado ninguna de las opciones anteriores y no es correcta la selección $USER"

			echo

			echo "Saliendo del programa..."


			exit 6


		;;


		esac

done
