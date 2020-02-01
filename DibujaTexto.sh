#! /usr/bin/bash -u

while read linea
do
	
        lon=$(echo -n $linea| wc -c)
	i=1
	
	while [ $i -lt $lon ]
	do
		numero= $(echo -n $linea | cut -c $i)
		let i++
		caracter=$(echo -n $linea | cut -c $i) 
		let i++
	   	for j in $(seq 1 $numero)
		do
			echo -n "$caracter"	
		done
	done	
	echo
done < $1

#recorrer un fichero por palabras
#while read linea
#do
#	 for p in $linea
#	 do
#		echo $p
#	done
#done < $1
