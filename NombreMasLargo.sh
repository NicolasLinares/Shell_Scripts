#! /bin/bash -u

if [ $# -eq 0 ]
then
        echo Escribe al menos un directorio. >&2
        exit 2
fi

for v in $@
do
        if [ ! -d $v  ]
        then
                echo El directorio $v no existe  >&2
                exit 2
        fi
done


maximo=0

find "$@" -type f -printf "%f\n" 2> /dev/null | cut -d'.' -f1 | uniq | ( while read line
do

	actual=$(echo -n $line | wc -m )

        if [ $maximo -lt $actual ]
        then
                maximo=$actual
        fi

done

nletras=0

find "$@" -type f -printf "%f\n" 2>/dev/null| cut -d '.' -f1 | while read linea
do
	nletras=$(echo -n $linea | wc -m)

	if [ $nletras -eq $maximo ] 
	then
		find "$@" -type f 2> /dev/null | grep -w $linea
	fi
done)

