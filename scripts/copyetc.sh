#!/bin/bash

directorioEtc=$(ls /etc/)

echo "Realizando copia de los ficheros del directorio /etc/ un momento por favor..."

sleep 2

for i in $directorioEtc; do

	sudo cp -r /etc/$i /etc/$i.bak

done

echo "Operacion completada con éxito $USER, te devuelvo a tu prompt"

ls -l /etc/ | grep .bak$

sleep 1
