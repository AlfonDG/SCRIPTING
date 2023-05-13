#!/bin/bash

echo "Hola $USER bienvenido al script/función que te permitirá sumar dos elementos pasados como argumentos"

echo

source /etc/funcions

if [ $# -eq 0 ]; then

	noparam

	exit 1
fi

sumaArgumentos=$(($1+$2))

echo "El resultado de la suma de $# argumentos pasados y los prámetros \$1 y \$2 será igual a $sumaArgumentos"

echo

sleep 1

echo -n "Acabas de sumar dos valores. Deseas simar otros dos más? (y/n): "

read yesNo

if [[ $yesNo == "y" ]]; then

        echo "Perfecto, entonces sumaremos de nuevo unos nuevos valores."

        echo -n "Introduce el primer valor: "

        read valor1

        echo -n "Introduce el segundo valor: "

        read valor2

        ./sumaarg.sh $valor1 $valor2

else
        echo "Ok, entonces saldremos del programa..."

        echo

        exit 2
fi
