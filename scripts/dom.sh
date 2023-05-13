#!/bin/bash

mes=$(date +%B)

year=$(date +%Y)

if [ $((year % 4)) -eq 0 -a $((year % 100)) -ne 0 ] || [ $((year % 400)) -eq 0 ]; then

    echo "El año $year es un año de traspaso"

    yearTraspaso=true

else

    echo "El año $year no es un año de traspaso"

    yearTraspaso=false

fi

if [[ $mes -eq "enero" ]] || [[ $mes -eq "marzo" ]] || [[ $mes -eq "mayo" ]] || [[ $mes -eq "julio" ]] || [[ $mes -eq "agosto" ]] || [[ $mes -eq "octubre" ]] || [[ $mes -eq "diciembre" ]]; then

    echo

    echo "El mes $mes tienen un total de 31 de días."

elif [[ $mes -eq "abril" ]] || [[ $mes -eq "junio" ]] || [[ $mes == "septiembre" ]] || [[ $mes -eq "noviembre" ]]; then


    echo

    echo "El mes $mes tiene un total de 30 días."


elif [[ $mes -eq "febrero" ]]; then

    if [[ $yearTraspaso == true ]]; then

        echo "El mes $mes tendrá un total de 29 días."

    else

        echo "El mes $mes tendrá un total de 28 días."

   fi

else

	echo "El mes $mes no es correcto."

fi
