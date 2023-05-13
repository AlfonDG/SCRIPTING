#!/bin/bash

echo "Hola $USER, te mostramos a continuación el script que te permitirá comprimir un directorio."

echo


echo -n "Introduzca la ruta donde desea almacenar el fichero comprimirdo: "

read -t 15 rutaUser

echo -n "Ahora introduzca el nombre del directorio que desea comprimir: "

read dirUser

if [[ ! -d $dirUser ]]; then

	echo "Lo sentimos, pero el directorio $dirUser no existe..."

	echo

	echo "Saliendo del programa debido a error..."

	sleep 1

	exit 1
fi

cat << compressions
"El comando GZIP permite comprmir ficheros, directorios en formato .tar"
"El comando BZIP2 permite comprimir ficheros, directorios en formato .bz2"
"El comando COMPRESS permite comprimir los directorios o ficheros en formato .rar o .arj"
"El comando ZIP permite comprimir los directorios o ficheros en formato .zip"
compressions

echo

echo "Ahora te pedimos que escojas una opción válida entre los siguientes ejemplos -> (g/se comprimirá el directorio usando GZIP | b/Se comprimirá el directorio o fichero ejecutando BZIP | c/Se comprimirá en formato COMPRESS y finalmente z/Comprimirá en formato ZIP)"

sleep 1

read compressioUser

case $compressioUser in

g)
	echo "Has seleccionado al opción de comprimir en formato GZIP, procedemos a compormir el directorio $dirUser"

	echo "Comprimiendo el directorio $dirUser... Un momento por favor"

	sleep 2

	sudo tar -czf $dirUser.tar.gz $rutaUser

	echo "Operación completada correctamente"

	ls -ld $(pwd)

	;;


b)

	echo "Has seleccionado la opción de comprimir en formato BZIP2, procedemos a compirmir el directorio $dirUser"

	echo "Comprimiendo el directorio $dirUser... Un momento por favor"

	sleep 2

	sudo tar -cjf $dirUser.tar.bz2 $rutaUser

	echo "Operación completada correctamente"

	ls -ld $(pwd)

	;;

c)

	echo "Has seleccionado la opción de comprimir en formato COMPRESS, procedemos a comprimir el directorio $dirUser"

	echo "Comprimiedo el directorio $dirUser... Un momento por favor"

	sleep 2

	sudo tar -cf $dirUser.tar $rutaUser

	echo "Operación completada correctamente"

	ls -ld $(pwd)

	;;


z)
	echo "Has seleccionado la opción de comprimir en formato ZIP, procedemos a comprimir el directorio $dirUser"

	echo "Comprimiendo el directorio $dirUser... Un momento por favor"

	sleep 2

	sudo zip -r $dirUser.zip $rutaUser

	echo "Operación completada correctamente"

	ls -ld $(pwd)

	;;

*)

	echo "Has seleccionado una opción que no es válida y saldremos al PROMPT del usuario actual $USER"

	sleep 1

	exit 2

	;;

esac
