#!/bin/bash

colors=(vermell blau verd negre taronja groc blanc lila gris marró)

texto="El color és el teu color de la sort per avui"

numeroRandom=$(( $RANDOM % 10 ))

colorRandom=${colors[$numeroRandom]}

sustitucionTexto=${texto/color/$colorRandom}

echo $sustitucionTexto
