#! /usr/bin/bash -u

if  [ $# -ne 1 ]
then
	echo Sintaxis: $0 enteropositivo >&2   # los errores siempre por la salida de error
	exit 2
fi

if ! echo $1 | grep -xq '[0-9]\+'
then
               echo Sintaxis: $0 enteropositivo >&2   
        exit 2
fi

izq=1
der=$(echo -n $1 | wc -c) #nº de caracteres de la cadena
while [ $izq -lt $der ] 
do
	carizq=$(echo -n $1 | cut -c $izq)
	carder=$(echo -n $1 | cut -c $der)
	if [ $carizq -ne $carder ] 
	then
		exit 1
	fi
	let izq++
	let der++
done
exit 0
