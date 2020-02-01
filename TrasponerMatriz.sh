#! /bin/bash -u

if [ $# -ne 1  ]
then 	
	echo Uso: $0 fichero >&2
	exit 1
fi

if [ ! -r $1  ]
then
	echo El fichero $1 no existe o no se puede leer >&2
	exit 2
fi

if [ ! -s $1  ]
then
        echo El fichero debe contener, al menos, una línea >&2
        exit 3
fi


columnas=$(head -1 "$1" | wc -w)
cat $1 | while read linea
do
	n=$( echo  $linea | wc -w )
	if [ $n -ne $columnas ]
	then
		echo No todas las filas tienen el mismo número de campos >&2
	exit 4
	fi
done

i=1
while [ $i -lt $columnas ]
do
	fila=$(cat $1 | tr -s ' ' | cut -d' ' -f$i )
	echo  $fila
	let i++
done | column -t


