#!/bin/bash

# Este script permite saber si un valor es par o impar usando una lista

llistanum=($@)

if [[ $llistanum -eq 0 ]]; then

	echo "Lo siento $USER la lista está vacía ya que no has añadido ningún parámetro"

	echo

	echo "Saliendo del programa..."

	exit 1

fi

count=0

while [ "x${llistanum[count]}" != "x" ]; do

 num=$(( ${llistanum[count]} % 2 ))

 if [[ $num -eq 0 ]]; then

 	echo "${llistanum[count]} es par"

 else

 	echo "${llistanum[count]} es impar"

 fi

 count=$(( $count + 1 ))

done
