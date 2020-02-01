#! /bin/bash -u

#A)

total=$(ls -l $1 |tail -n +2 | tr -s ' ' | cut -d' ' -f5)

tamano=0
echo "$total" | (while read linea
do
	let tamano=$tamano+$linea
done
echo "Total : $tamano bytes "

#B) 
#en fichtam guardo las dos variables que necesito
# voy leyendo cada linea, separa fichero y tamaño las utilizo por separado


fichtam=$(ls -l $1 | tail -n +2 | tr -s ' ' | cut -d ' ' -f5,9)

echo "$fichtam" | while read linea
do	
	fich=$(echo $linea | cut -d ' ' -f2)
	tam=$(echo "$linea" | cut -d ' ' -f1)
	nletras=$(echo -n $fich | wc -c)

	#si el numero de letras es menor que 9 las escribo y luego escribo espacios
	#sino escribo las 9 letras primeras del nombre del fichero

	if [ $nletras -lt 9 ]
	then
		#escribo las letras que tenga ...
		EA=1
        	while [ $EA -le $nletras ] 
        	do
               		c=$(echo -n $fich | cut -c $EA)
                	echo -n $c
                	let EA+=1
        	done

		#escribo el resto en espacios
		while [ $nletras -le 9 ] 
        	do
                	echo -n " "
        	        let nletras+=1
	        done
		
		#calculo el porcentaje y el numero de asteriscos de la barra
		let porcent=$tam*100/$tamano
		let numAster=60*$porcent/100

		#dibujamos la barra de asteriscos
                i=1
                while [ $i -le $numAster ]
                do
                        echo -n "*"
                        let i++
		done
		
		#escribimos el porcentaje
		echo -n " $porcent%"
		echo

	else
		# escribimos los 9 primeros caracteres de la palabra
		EA=1	
		while [ $EA -le 9 ] 
		do 
			c=$(echo -n $fich | cut -c $EA)
			echo -n $c
			let EA+=1	
		done
		
		#uno más para que no se junte el nombre del fichero con los asteriscos		
		echo -n " "	
		
		#calculo el porcentaje y el numero de asteriscos de la barra
		let porcent=$tam*100/$tamano
		
		let numAster=60*$porcent/100
		
		#dibujamos la barra de asteriscos
		i=1
		while [ $i -le $numAster ]
		do
			echo -n "*"
			let i++
		done
		
		#escribimos el porcentaje
		echo -n " $porcent% "
		echo
	fi
	
done)
