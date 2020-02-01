#! /bin/bash -u 

listaUsuarios=$(ps aux | tail -n +2 | tr -s ' ' | cut -d ' ' -f1,1 | sort | uniq   )
#nos fijamos cuales son los usuarios


for u in $listaUsuarios     #por cada usuario...
do	
	listaProcesos=$(ps aux | tail -n +2 | tr -s ' ' | cut -d' ' -f1,5 | grep ^$u |  cut -d' ' -f2 | uniq  )
	#... nos fijamos en usuario buscado con grep y creamos en total una lista de solo sus procesos


	cantidad=0
	
	for v in $listaProcesos
	do	
		let cantidad+=$v
		
	done
		
	echo "$u    $cantidad  KiB"	


done








