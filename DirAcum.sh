#! /bin/bash -u

if [ $# -ne 1  ]
then
	echo Escribe el directorio donde quieras buscar <&2
	exit 2
fi

if [ ! -d $1 ] 
then
	echo Directorio no valido >&2
	exit 2
fi

total=$(find $1 -iname "*.pdf" -exec ls -l {} \; | tr -s ' ' | cut -d' ' -f1,5,9)

echo "PERMISOS       TAMAÑO      ACUMULADO                     NOMBRE"

acumulado=0

echo "$total" | while read linea 
do	
	permiso=$(echo $linea | cut -d' ' -f1)
	tamano=$(echo $linea | cut -d' ' -f2)
	let acumulado=$acumulado+$tamano
	nombre=$(echo $linea | cut -d' ' -f3)
	
	echo "$permiso     $tamano     $acumulado          $nombre "
done

