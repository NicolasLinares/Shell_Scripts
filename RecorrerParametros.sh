#! /usr/bin/bash -u

echo  '$@ sin comillas dobles'
for p in $@
do 
	echo Parámetros: $p
done

echo  "$@ con comillas dobles"
for p in $@
do 
	echo Parámetros: $p
done

