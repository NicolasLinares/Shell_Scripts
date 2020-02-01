#! /bin/bash -u

#A) primero me quedo con una lista de los nombres, los ordeno y aplico uniq para que no se repitan...
for v in $@
do
	ls -l $v | tail -n +2 | tr -s ' ' | cut -d' ' -f3

#B)C)...por cada nombre voy a buscar todos sus archivos(grep)
done | sort | uniq | while read linea
do	
	acumulado=0

	for v in $@ 
	do
		ls -l $v | tail -n +2 | tr -s ' ' | cut -d' ' -f3,5 | grep -w $linea
#...quedándome solo con el tamaño que ocupan, que irá leyendo por cada linea y almacenando en acumulado
	done | cut  -d' ' -f2 | (while read line
	do
		let acumulado+=$line;
	done
#condición para mostrar acumulado en MiB o bytes
	if [ $acumulado -lt 1000000 ]
	then
		echo Usuario: $linea Ocupa en Disco: $acumulado bytes
	else 
		let acumulado=$acumulado/1000000
		echo Usuario: $linea Ocupa en Disco: $acumulado MiB
	fi)
done

#falta parte del C) y el D) entero 

			
