#! /bin/bash -u

if [ ! -d "$1" ]
then 
	echo $1 no es un directorio >&2
	exit 1
fi


find $1 -type f -printf "%-10.9f %s\n"
