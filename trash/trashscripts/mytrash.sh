#!/bin/bash

capacidadPapelera=$(ls -l "/trash/paperera/" | wc -l)

megasPapelera=$(du -h "/trash/paperera/")

echo "========================================================================================================================================"

echo

echo "Bienvenido al script MYTRASH.SH, actualmente su papelera contiene un total de $capacidadPapelera ficheros y un total de $megasPapelera"

echo

echo "Atención! Esta papelera se vaciará el día 28 de cada mes"

echo

echo "========================================================================================================================================"

echo

sleep 1

echo "En qué puedo ayudarte?: "

echo

PS3="Qué vols fer [1-7]: "

echo

opciones=("LlistarElsFitxersEliminats" "InformacióSobreUnFitxerEliminat" "RestaurarUnFitxer" "RestaurarPerExtensió" "BuidarLaPapereraAra" "BuidarNomésElsMésAntics" "SortirDeMyTrash")

select opcion in ${opciones[@]};

	do

	case $opcion in


	"LlistarElsFitxersEliminats")

		echo "Listar los ficheros que se encuentran actualmente dentro del directorio papelera"

		echo

		echo "Llamando a la función listarElementosPapelera, un momento por favor..."

		sleep 1

		. /trash/trashscripts/trashfunctions
		listarElementosPapelera

		echo

		echo "Se ha completado correctamente el listado de la papelera con éxito"

	;;

	"InformacióSobreUnFitxerEliminat")

		echo "Llamadno a la función informacionFicheroPerdido"

		echo

		. /trash/trashscripts/trashfunctions
		informacionFicheroPerdido

		echo

		echo "Se ha completado correctamente el listado de la papelera con éxito"

	;;


	"RestaurarUnFitxer")

		echo "Función de restaurar los ficheros"

		. /trash/trashscripts/trashfunctions
		restaurarFicheroPapelera

		echo

		echo "Función de restauración de un fichero ejecutada correctamente"
	;;

	"RestaurarPerExtensió")

		echo "Función que restaura por extensión"

		echo

		. /trash/trashscripts/trashfunctions
		extensionFichero

		echo

		echo "Función de Restauración por extensión ejecutada correctamente"

	;;

	"BuidarLaPapereraAra")

		echo "Función de vaciado de papelera ahora"

		echo

		. /trash/trashscripts/trashfunctions
		eliminarFicheroPapelera

		echo

		echo "Función ejecutada correctamente $USER"

	;;


	"BuidarNomésElsMésAntics")

		echo "Función de vaciado los más antiguos de la papelera"

		. /trash/trashscripts/trashfunctions
		numeroDiasEliminarContenido

		echo

		echo "Función ejecutada de vaciar los más antiguos de forma correcta"

	;;

	"SortirDeMyTrash")

		echo "Función de salida del script MyTrash.sh"

		. /trash/trashscripts/trashfunctions
		salirProgramaPapelera

		echo

		echo "Función de salida del script MyTrash.sh de forma correcta"

	;;

	esac

done