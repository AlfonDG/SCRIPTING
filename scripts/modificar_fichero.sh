#!/bin/bash

echo "Hola $USER, este script permitirá modificar el contenido del fichero $1 que se añadirá modificado a $2"

echo

quienSoy=$(whoami)

fichero1=$1

fichero2=$2

fechaActual=$(date +"%Y-%m-%d")

echo "Actualizando los valores del fichero $fichero1 y añadiendo a $fichero2..."

echo

sed -e  "s/[Hh]ola/Hi/g" -e "s/[Aa]diós/Bye/g" $fichero1 > $fichero2

echo "El fichero $fichero1 y el fichero $fichero2 han sido modificados por el usuario $quienSoy correctamente el día $fechaActual"
