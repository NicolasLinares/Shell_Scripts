#! /bin/bash -u

if test $# -ne 1  
then 
	echo Escribe el tamaño del montón
       	exit 1
else 

	if echo $1 | grep -x -q "[0-9]\+" 
	then
		if test $1 -le 0	
       		then
			echo Escribe un número mayor que cero
		       	exit 1
		else
			i=1
			z=1
			while test $i -le $1
			do
				j=1
				let veces=$1-$i
				while test $j -le $veces
				do
					printf ' '
					let j=$j+1
				done
				
				k=1
                                while test $k -le $z 
                                do
                                        printf '*'
                                        let k=$k+1
                                done
                                let z=$z+2
				
				
				echo
		     		let i=$i+1
		    	 done

		fi

	else 
		echo Escribe un número, no caracteres
		exit 1
	fi
fi	
