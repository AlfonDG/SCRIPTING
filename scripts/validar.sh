#!/bin/bash

actividadCase="/home/alfonsodg/scripts/mostrarLineasCase.sh"

$actividadCase $mostrar_todo $2

case $? in

1)
	echo "El exit 1 ha dado fallo de que no encuentra el fichero"
	;;
2)

	echo "El error exit 2 significa que no ha podido realizar bien la copia de seguridad"
	;;

*)
	echo "El programa ha funcionado correctamente"
	;;
esac
