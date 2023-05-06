#!/bin/bash

#Aquest script determina si un color del espectre lluminòs és primari o no

color1=$1

espectre=$2

if [[ $color1  -eq "blau" ]] || [[ $color1 -eq "verd" ]] || [[ $color1 -eq "vermell" ]]; then

	echo "$color1 és un color primari de l’espectre de llum."


else
	echo "$color1 no és un color primari de l'espectre de llum."
fi

if [[ $espectre -eq "cian" ]] || [[ $espectre -eq "magenta" ]] || [[ $espectre -eq "groc" ]]; then

	echo "$espectre és pigment."

else

 	echo "$espectre no és pigment."

fi
