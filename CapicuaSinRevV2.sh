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


der=$(echo -n $1 | wc -c) #nº de caracteres de la cadena
nuevo=
while [ $der -ge 1 ] 
do
	nuevo=$nuevo$(echo -n $1 | cut -c $der) # concatenación
	
	let der--
done

if  [ $1 -eq $nuevo ]
then
	exit 0
else 
	exit 1
fi
