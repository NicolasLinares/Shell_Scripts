#! /usr/bin/bash -u

N=5


if [ $# -eq 0  ]
then
	echo $(($RANDOM%$N+1))
else
	numero=$(($RANDOM%$N+1))
	existe=1
	while [ $existe -eq 1 ]
	do
		existe=0
		echo "Buscando si existe coincidencia con $numero..."
 		for p in "$@" 
      		do
			if [ "$p" =  $numero ] #el igual es para comparar cadenas, por eso si pongo -eq y llamo al guión con bash -u Aleatorio.sh $(seq 1 90) asd das    <-- entonces nos dará error en esos parámetros
			then
				existe=1
				echo "	*Coincidencia con $p"
				numero=$(($RANDOM%$N+1))
				break
			fi
		done
	done
	echo $numero
fi
