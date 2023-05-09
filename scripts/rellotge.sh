#!/bin/bash

PS3="Selecciona la opción que desea: "

opciones=("CuentaAtrás" "Alarma" "Cronómetro" "Salir")

echo "===================================================================="
echo
echo "Hola $USER bienvenido a su reloj actualmente son las | $(date +%T)"
echo
echo "===================================================================="
echo
echo "Estas son las opciones d ela que dispone su reloj $USER"


select opcion in ${opciones[@]};

	do
		case $opcion in


		"CuentaAtrás")

			echo

			echo "Has seleccionado la cuenta atrás"

			echo

			echo -n "A continuación facilita el segundo en el cual relizaremos la cuenta atrás: "

			read segundos


			if [[ -z $segundos || $segundos -lt 0 ]]; then

        			echo "No has pasado ningún parámetro, deberías pasar un número"

				echo

				sleep 1

				echo "He detectado $USER que también posiblemente no hayas adjuntado un segundo correcto o sea inferior de 0"

        			echo

        			echo "Saliendo del programa..."

        			exit 1

			fi

			cuentaAtras=$segundos


			while [[ $cuentaAtras -gt 1 ]]; do

        			cuentaAtras=$(( $cuentaAtras - 1 ))

        			sleep 1

        			echo $cuentaAtras

			done

			;;



		"Alarma")

			echo

			echo "Has seleccionado la opción de alarma"

			echo

			echo -n "Introduzca por favor las horas en formato HH y los minutos en formato MM: "

			read hora

			read minuts

			if [[ -z $hora ]] || [[ -z $minuts ]]; then

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

			;;

		"Cronómetro")

			echo "Has seleccionado el apartado del cronómetro de tu reloj"

			echo

			echo -n "Pulsa una tecla y comenzaremos el cronómetro, recuerda que para parar el crono puedes pulsar ELIMINAR/ATRÁS, tienes 10 segundos: "

			read -t 10 teclaEnter

                        if [[ $# -eq 0 ]]; then

                                echo "No has pasado ningún parámetro, deberías pasar un número"

                                echo

                                sleep 1

                                echo

                                echo "Saliendo del programa..."

                                exit 1

                        fi

                        cuentaAtras=$parametroUser


                        while [ $tecla -ne "" ]; do

                                avanzar=$(( $avanzar + 1 ))

                                sleep 1

                                echo $avanzar

                        done


			;;

		"Salir")

			echo "Saliendo del programa, gracias por usar el script RELOJ.SH *$USER*"

			echo

			exit 1


			;;

		*)

			echo "No has seleccionado una opción válida de las anteriores."


			exit 2

			;;

		esac
done
