#! /usr/bin/bash -u
contador=0
cat $1 | (while read linea
do
	let contador++
done
echo Hijo: $contador)
echo Padre: $contador
