#! /bin/bash -u

if test $# -ne 1 
then 
	echo "Escribe el usuario que buscas"  >&2
	exit 1
fi

contador=$(who | grep -w ^$1 | wc -l)
echo El usuario $1 está conectado $contador veces

