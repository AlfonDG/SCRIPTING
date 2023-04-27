#!/bin/bash

echo "Este script permitirá contar el número de líneas que contiene un fichero pasado por usted $USER"

sleep 1

echo

echo "El número de líneas en el fichero $1 adjuntado serán de..."

sed -n '$=' $1

echo "líneas"

echo

echo "Ahora pasaremos a mostrar el número de espacios en blanco que contiene un fichero"

sleep 1

echo "El número de líneas en blanco del fichero $1 será de..."

sed -n '/^$/=' temp.txt | wc -l

echo "líneas"

echo "Gracias por usar el script blancs.sh, le devolvemos a su prompt $USER"

sleep 1

echo
