#!/bin/bash

echo "========================================================================="

echo

echo "Hola $USER bienvenido al script NETEJA.SH, a continuación te mostramos como funcionará el vaciado del directorio papelera el 28 de cada mes"

echo

echo "=========================================================================="

diaMes=$(date +%d)

fechaActualMes=$(date +%D)

if [[ $diaMes -eq 28 ]]; then

	echo "Te avisamos $USER de que procedermeos a vaciar el directorio papelera de reciclaje el 28 de cada mes"


	echo

	echo "Primero realizaremos la copia de seguridad de los ficheros restauracio.log y trashlog.log a olds"

	sleep 1

	echo "Realizando una copia de seguridad de los scripts trashlogs.log a trashlogs.old.date y restauracio.logs a restauracio.old.date"

	echo

	echo "Realizando copia..."

	sleep 1

	sudo cp -r "/trash/trashlogs/trashlog.log" "/trash/olds/trashlog.old.$(date +%m%Y)"

	sudo cp -r "/trash/trashlogs/restauracio.log" "/trash/olds/restauracio.old.$(date +%m%Y)"

	echo "Copia completada correctamente"

	echo -n "Procedemos a eliminar el directorio trash al completo, desea continuar con este proceso [y/n]: "

	read siNoVaciarPapelera

	if [[ $sinoVaciarPapelera == "n" ]]; then

		echo "Vale $USER, no continuaremos con la opción de borrado completo de la papelera"

		echo

		echo "Abortando la operación..."

		exit 1


	else

		echo "Ok, entonces $USER procedemos a limpiar de forma completa la papelera de reciclaje"

		echo

		echo "Limpiando la papelera..."

		sleep 1

		sudo rm -r /trash/paperera/*

		echo "Directorio papelera limpiada con éxito y de forma correcta. Te mostramos el resultado a continuación"

		mostrarPapelera=$(ls -l /trash/paperera)

		echo $mostrarPapelera

	fi

fi
