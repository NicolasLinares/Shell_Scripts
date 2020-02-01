#! /bin/bash -u

if [ $# -ne 2 ]
then	
	echo Uso: $0 fichero número  >&2
	exit 1
fi

if [ ! -f $1  ]
then
	echo El fichero $1 no existe o no se puede leer  >&2
	exit 2
fi

if !(echo $2 | grep -x -q "[1-9]\+")
then
        echo $2 no es un número entero o mayor que 0 >&2
        exit 3
fi



total=$(cat $1 | wc -w)
echo $total palabras


lista=$(cat $1)
for l in $lista
do
	echo $l

done | sort -r | uniq -c -i | while read linea
do
	veces=$(echo $linea | tr -s ' ' | cut -d' ' -f1)
	fichero=$(echo $linea | tr -s ' ' | cut -d' ' -f2)
	
	let porcent=$veces*100/$total
	
	echo $fichero: $veces  "("$porcent"%)"

done  | head -n $2

